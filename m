From: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v5 0/8] improve late microcode loading
Date: Tue, 29 Jan 2019 20:11:33 +0800
Message-ID: <20190129121131.GA8228@gao-cwp>
References: <1548659210-16870-1-git-send-email-chao.gao@intel.com>
 <20190129113151.m2xsmi4qrk335xev@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Content-Transfer-Encoding: 8bit
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1edO=QF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1goSAw-0001zG-Oo
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 12:07:34 +0000
Content-Disposition: inline
In-Reply-To: <20190129113151.m2xsmi4qrk335xev@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 29, 2019 at 12:31:51PM +0100, Roger Pau Monné wrote:
>On Mon, Jan 28, 2019 at 03:06:42PM +0800, Chao Gao wrote:
>> Changes in this version:
>>  - support parallel microcode updates for all cores (see patch 8)
>>  - Address Roger's comments on the last version.
>> 
>> The intention of this series is to make the late microcode loading
>> more reliable by rendezvousing all cpus in stop_machine context.
>> This idea comes from Ashok. I am porting his linux patch to Xen
>> (see patch 7 for more details).
>> 
>> This series makes three changes:
>>  1. Patch 1-6: introduce a global microcode cache
>>  2. Patch 7: synchronize late microcode loading
>>  3. Patch 8: support parallel microcodes update on different cores
>> 
>> Currently, late microcode loading does a lot of things including
>> parsing microcode blob, checking the signature/revision and performing
>> update. Putting all of them into stop_machine context is a bad idea
>> because of complexity (One issue I observed is memory allocation
>> triggered one assertion in stop_machine context). In order to simplify
>> the load process, I move parsing microcode out of the load process.
>> The microcode blob is parsed and a global microcode cache is built on
>> a single CPU before rendezvousing all cpus to update microcode. Other
>> CPUs just get and load a suitable microcode from the global cache.
>> With this global cache, it is safe to put simplified load process to
>> stop_machine context.
>> 
>> Regarding changes to AMD side, I didn't do any test for them due to
>> lack of hardware. Could you help to test this series on an AMD machine?
>> At least, two basic tests are needed:
>> * do a microcode update after system bootup
>> * don't bring all pCPUs up at bootup by specifying maxcpus option in xen
>>   command line and then do a microcode update and online all offlined
>>   CPUs via 'xen-hptool'.
>> 
>
>Thanks for the series, I think it's a good improvement to current
>microcode loading.
>
>I would like to ask how have you tested the series, I don't seem to
>find any tool in the current tree to load a microcode to Xen. The only
>thing I've found is:
>
>https://lists.xen.org/archives/html/xen-devel/2013-07/txtpyXvYZGRwb.txt
>
>Have you used this tool to test the code?

Yes. I am using this patch with some issues fixed.

Thanks
Chao


--UugvWAfsgieZRqgk
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-misc-xenmicrocode-Upload-lib-firmware-some-blob-to-t.patch"

>From ff00662f3e35f661a06dbf143150f300664d5e93 Mon Sep 17 00:00:00 2001
From: Chao Gao <chao.gao@intel.com>
Date: Fri, 9 Mar 2018 20:01:53 +0800
Subject: [PATCH 1/9] misc/xenmicrocode: Upload /lib/firmware/<some blob> to
 the hypervisor

Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 tools/libxc/include/xenctrl.h |  1 +
 tools/libxc/xc_misc.c         | 19 +++++++++++
 tools/misc/Makefile           |  4 +++
 tools/misc/xenmicrocode.c     | 73 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 tools/misc/xenmicrocode.c

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 31cdda7..c69699b 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1245,6 +1245,7 @@ typedef uint32_t xc_node_to_node_dist_t;
 int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
+int xc_platform_op(xc_interface *xch, struct xen_platform_op *op);
 int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
                 xc_meminfo_t *meminfo, uint32_t *distance);
 int xc_pcitopoinfo(xc_interface *xch, unsigned num_devs,
diff --git a/tools/libxc/xc_misc.c b/tools/libxc/xc_misc.c
index 5e6714a..76e1bd5 100644
--- a/tools/libxc/xc_misc.c
+++ b/tools/libxc/xc_misc.c
@@ -226,6 +226,25 @@ int xc_physinfo(xc_interface *xch,
     return 0;
 }
 
+int xc_platform_op(xc_interface *xch, struct xen_platform_op *op)
+{
+    int ret = 0;
+    DECLARE_PLATFORM_OP;
+    DECLARE_HYPERCALL_BOUNCE(op, sizeof(*op), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+
+    if ( xc_hypercall_bounce_pre(xch, op) )
+    {
+        PERROR("Could not bounce xen_platform_op memory buffer");
+        return -1;
+    }
+    op->interface_version = XENPF_INTERFACE_VERSION;
+
+    platform_op = *op;
+    ret = do_platform_op(xch, &platform_op);
+    xc_hypercall_bounce_post(xch, op);
+    return ret;
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index eaa2879..d522101 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -23,6 +23,7 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     += xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
 INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
+INSTALL_SBIN-$(CONFIG_X86)     += xenmicrocode
 INSTALL_SBIN                   += xen-ringwatch
 INSTALL_SBIN                   += xen-tmem-list-parse
 INSTALL_SBIN                   += xencov
@@ -118,4 +119,7 @@ xen-lowmemd: xen-lowmemd.o
 xencov: xencov.o
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
 
+xenmicrocode: xenmicrocode.o
+	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
+
 -include $(DEPS_INCLUDE)
diff --git a/tools/misc/xenmicrocode.c b/tools/misc/xenmicrocode.c
new file mode 100644
index 0000000..ba16d21
--- /dev/null
+++ b/tools/misc/xenmicrocode.c
@@ -0,0 +1,73 @@
+#define _GNU_SOURCE
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <errno.h>
+#include <string.h>
+#include <inttypes.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <xenctrl.h>
+
+int main(int argc, char *argv[])
+{
+    int fd = 0;
+    unsigned char *fbuf;
+    int len;
+    xc_interface *xc_handle;
+    char *filename;
+    struct stat buf;
+    DECLARE_HYPERCALL_BUFFER(struct xenpf_microcode_update, uc);
+    struct xen_platform_op op;
+    int ret;
+
+    filename = argv[1];
+    fd = open(filename, O_RDONLY);
+    if (fd <= 0) {
+        printf("Could not open; err: %d(%s)\n", errno, strerror(errno));
+        return errno;
+    }
+    if (stat(filename, &buf) != 0) {
+        printf("Could not open; err: %d(%s)\n", errno, strerror(errno));
+        return errno;
+    }
+
+    printf("%s: %ld\n", filename, buf.st_size);
+    len = buf.st_size;
+    fbuf = mmap(0, len, PROT_READ, MAP_PRIVATE, fd, 0);
+    if ( (xc_handle = xc_interface_open(0,0,0)) == 0 )
+    {
+        fprintf(stderr, "Error opening xc interface: %d (%s)\n",
+                errno, strerror(errno));
+        return 1;
+    }
+    if (fbuf == MAP_FAILED) {
+        printf("Could not map: error: %d(%s)\n", errno,
+               strerror(errno));
+        return errno;
+    }
+
+    uc = xc_hypercall_buffer_alloc(xc_handle, uc, len);
+    memcpy(uc, fbuf, len);
+
+    set_xen_guest_handle(op.u.microcode.data, uc);
+    op.cmd = XENPF_microcode_update;
+    op.interface_version = XENPF_INTERFACE_VERSION;
+    op.u.microcode.length = len;
+    ret = xc_platform_op(xc_handle, &op);
+    if ( ret )
+        fprintf(stderr, "Error in xc_platform_op %d\n", ret);
+
+    xc_hypercall_buffer_free(xc_handle, uc);
+    xc_interface_close(xc_handle);
+
+    if (munmap(fbuf, len)) {
+        printf("Could not unmap: %d(%s)\n", errno, strerror(errno));
+        return errno;
+    }
+    close(fd);
+    return 0;
+}
-- 
1.8.3.1


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--UugvWAfsgieZRqgk--
