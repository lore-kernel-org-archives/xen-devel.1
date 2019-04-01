From: Glenn Enright <glenn@rimuhosting.com>
Subject: livepatch-build-tools: fix section mismatch
Date: Mon, 1 Apr 2019 15:28:59 +1300
Message-ID: <8a1e6171-0238-4e64-5879-44233d3dec64@rimuhosting.com>
Reply-To: glenn@rimuhosting.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------DFC51192C151DF6B6897F7A2"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: ross.lagerwall@citrix.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------DFC51192C151DF6B6897F7A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I hit an issue generating a livepatch for a recent xsa. I saw the 
following lines from the create-diff-object.log ...

/livepatch-build-tools/create-diff-object: ERROR: grant_table.o: 
kpatch_regenerate_special_section: 1162: group size mismatch for section 
.altinstructions

This looks really similar to the issue reported and fixed in 
https://github.com/dynup/kpatch/pull/528

The attached patch is based on that report, and resulted in a good 
livepatch. The alt section size in my case was actually 14.

Regards, Glenn

--------------DFC51192C151DF6B6897F7A2
Content-Type: text/x-patch;
 name="00_fix_section_sizes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="00_fix_section_sizes.patch"

diff --git a/create-diff-object.c b/create-diff-object.c
index 82f777e..f9f4abf 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -962,9 +962,35 @@ static int bug_frames_0_group_size(struct kpatch_elf *kelf, int offset) { return
 static int bug_frames_1_group_size(struct kpatch_elf *kelf, int offset) { return 8; }
 static int bug_frames_2_group_size(struct kpatch_elf *kelf, int offset) { return 8; }
 static int bug_frames_3_group_size(struct kpatch_elf *kelf, int offset) { return 16; }
-static int ex_table_group_size(struct kpatch_elf *kelf, int offset) { return 8; }
-static int altinstructions_group_size(struct kpatch_elf *kelf, int offset) { return 12; }
+int ex_table_group_size(struct kpatch_elf *kelf, int offset)
+{
+	static int size = 0;
+	char *str;
+
+	if (!size) {
+		str = getenv("EX_STRUCT_SIZE");
+		if (!str)
+			ERROR("EX_STRUCT_SIZE not set");
+		size = atoi(str);
+	}
+
+	return size;
+}
 
+int altinstructions_group_size(struct kpatch_elf *kelf, int offset)
+{
+	static int size = 0;
+	char *str;
+
+	if (!size) {
+		str = getenv("ALT_STRUCT_SIZE");
+		if (!str)
+			ERROR("ALT_STRUCT_SIZE not set");
+		size = atoi(str);
+	}
+
+	return size;
+}
 /*
  * The rela groups in the .fixup section vary in size.  The beginning of each
  * .fixup rela group is referenced by the .ex_table section. To find the size
diff --git a/livepatch-build b/livepatch-build
index c057fa1..6c3409c 100755
--- a/livepatch-build
+++ b/livepatch-build
@@ -304,6 +304,27 @@ if [ "${SKIP}" != "build" ]; then
         XEN_DEBUG="debug=$XEN_DEBUG"
     fi
 
+    echo "Reading special section data"
+    SPECIAL_VARS=$(readelf -wi "$XENSYMS" |
+        gawk --non-decimal-data '
+	BEGIN { a = e = 0 }
+	a == 0 && /DW_AT_name.* alt_instr$/ {a = 1; next}
+	e == 0 && /DW_AT_name.* exception_table_entry$/ {e = 1; next}
+	a == 1 {printf("export ALT_STRUCT_SIZE=%d\n", $4); a = 2}
+	e == 1 {printf("export EX_STRUCT_SIZE=%d\n", $4); e = 2}
+	a == 2 && b == 2 && p == 2 && e == 2 {exit}')
+
+    [[ -n $SPECIAL_VARS ]] && eval "$SPECIAL_VARS"
+
+    if [[ -z $ALT_STRUCT_SIZE ]] || [[ -z $EX_STRUCT_SIZE ]]; then
+	die "can't find special struct size"
+    fi
+    for i in $ALT_STRUCT_SIZE $EX_STRUCT_SIZE; do 
+	if [[ ! $i -gt 0 ]] || [[ ! $i -le 16 ]]; then
+		die "invalid special struct size $i"
+	fi
+    done
+
     echo "Perform full initial build with ${CPUS} CPU(s)..."
     build_full
 

--------------DFC51192C151DF6B6897F7A2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------DFC51192C151DF6B6897F7A2--
