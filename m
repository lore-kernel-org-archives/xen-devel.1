Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AF8C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407267.1640417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28DC-0007e6-Cu; Thu, 03 Sep 2026 14:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407267.1640417; Thu, 03 Sep 2026 14:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28DC-0007dj-7W; Thu, 03 Sep 2026 14:14:42 +0000
Received: by outflank-mailman (input) for mailman id 1407267;
 Thu, 03 Sep 2026 14:14:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679edcb9000c4f3@swg.vates.tech>)
 id 1x28DA-0007Ru-PS
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28DA-001HAI-65
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679edcb9000c4f3@swg.vates.tech>)
 id 6a9980bd-2eae-0a2a0a5409dd-0a2a4505c668-38
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:40 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679edcb9000c4f3@swg.vates.tech>)
 id 6a9980cb-4cb1-0a2a45050019-b9ff1c228579-5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:40 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679edcb9000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:19 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E7C2284011;
 Thu,  3 Sep 2026 16:14:18 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=X+GMiNwPDnM2Yn/cscWUSLUInDV4hAIUbO0QY9cSEz4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=n6A6v6OJRPpxsRHL71sjEiq/CHSlVnz+nKDoDsIiz3MqZ/jhYsSQlnu6A5caPcT/OvpVeVDOu
 USNAnUvh6GH8PSJmeS7vOrBOfbJnuwk8kYwFj3or4ew6W/bX1g9EgXJ5XSvCOoYDj6/ece+Ywu9
 2pYOVatCAxEn6lCBrwNEVuDjKYPf3XMfeZLG5kX00pmNA4avO0dzEfqxOFoUtDK2A9br4vhjudJ
 l//JdSFanSu2I3TFqz1v2pLKxws+Z4k/h4Z2vhSRGRgILYtJ/ePp9jurvsVNYPmaVvDTwI1cOnX
 YWjzGEPrs5sTx0eeu7Dh5kgAXM4XVtC8ntCNZbAEdgag==
X-Zone-Loop: 88865dbdf5dde7b16d5315d2b90afe816912eb9d03fb
x-campaign-type: default
x-transaction-id: 8fb334c3-3549-45f1-89da-701e101f6a05
x-swg-uid: 01-c0bad502-9462-4659-a18c-743f20f32cb6
X-Mailer: Sweego
Message-ID:
 <1788444859.8631fc262581453bbf619ec5b2062170.1a0679edcb9000c4f3@vates.tech>
x-swg-bid: 1788444859.8631fc262581453bbf619ec5b2062170.1a0679edcb9000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 10/11] hvm/ioreq: Negotiate extended destination ID support per ioreq server
Date: Thu,  3 Sep 2026 16:14:08 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35ad.88da934c2c0754a.1a0679edb1d.ec095fd8a6ac7414=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444859165
X-purgate-ID: tlsNG-c201ff/1788444880-F66B52A1-5C04D7D4/0/0
X-purgate-type: clean
X-purgate-size: 16762

---=Part.35ad.88da934c2c0754a.1a0679edb1d.ec095fd8a6ac7414=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Extended (15-bit) MSI / IO-APIC destination IDs need Xen to decode the
raw MSI message for every passthrough MSI, which in turn requires every
device model to use XEN_DMOP_bind_pt_msi_irq=2E Let each ioreq server
advertise that it does so:

- XEN_DMOP_create_ioreq_server gains a flags byte (reusing pad[0]) with
  XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID=2E arch_ioreq_server_create_check()
  validates the flags (rejecting unknown bits, and the whole flag on
  non-x86) and, once the feature is locked, refuses a server that lacks
  it=2E

- hvm_ext_dest_id_enabled() is true if at least one server exists and
  all of them opted in=2E arch_domain_creation_finished() latches the
  result into the tri-state d->arch=2Ehvm=2Eext_dest_id, unless a migratio=
n
  stream already fixed it=2E

- A new HVM_SAVE_TYPE(EXT_DEST_ID) record (with save/check/load)
  migrates the latched value, so the destination host behaves
  identically regardless of when its device model re-registers ioreq
  servers=2E A stream from a Xen predating the feature carries no such
  record=2E hvm_load() then resolves the still-UNSET state to DISABLED so
  arch_domain_creation_finished() does not mistake the restored domain
  for a fresh one and enable the feature behind an unaware guest=2E

libxendevicemodel's xendevicemodel_create_ioreq_server() grows the flags
argument (0 for existing callers)=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Commit message rewritten as a bulleted summary=2E
- As discussed with Jan: The creation_finished latch only fires while it
  is still UNSET, so a value restored from the migration stream wins=2E v4
  OR-ed hvm_ext_dest_id_enabled() onto a bool, which flipped an unaware
  migrated guest to ENABLED=2E
- hvm_ext_dest_id_enabled() moved out of the header into common/ioreq=2Ec
  as a function with a locking note=2E It iterates via
  ARRAY_SIZE(d->ioreq_server=2Eserver), not MAX_NR_IOREQ_SERVERS=2E
- Flags are unsigned int now=2E Flag-bit validation is arch-specific
  arch_ioreq_server_create_check() rejects unknown bits and the Arm stub
  rejects any non-zero flag=2E The is_hvm_domain() check is dropped from
  the x86 hook=2E The post-lock rejection tests EXT_DEST_ID_ENABLED
  explicitly=2E
- The save record gains a check handler (ext_dest_id_check)=2E Load
  validates the enum range and returns -ENODATA on a truncated record=2E
- Save-record comment de-x86-ified=2E
- A stream from a Xen predating the feature carries no EXT_DEST_ID
  record, so hvm_load() resolves the UNSET state to DISABLED at
  end-of-stream=2E
- Removed the vIO-APIC ioapic_check() extended-bit rejection loop=2E
- Added parentheses around the bitwise logic=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 tools/include/xendevicemodel=2Eh          |  3 +-
 tools/libs/ctrl/xc_devicemodel_compat=2Ec |  2 +-
 tools/libs/devicemodel/core=2Ec           |  3 +-
 xen/arch/arm/ioreq=2Ec                    |  6 +++
 xen/arch/x86/domain=2Ec                   | 13 ++++++
 xen/arch/x86/hvm/ioreq=2Ec                | 57 +++++++++++++++++++++++++
 xen/arch/x86/hvm/save=2Ec                 |  9 ++++
 xen/common/ioreq=2Ec                      | 31 ++++++++++++--
 xen/include/public/arch-x86/hvm/save=2Eh  | 16 ++++++-
 xen/include/public/hvm/dm_op=2Eh          | 13 +++++-
 xen/include/xen/ioreq=2Eh                 | 11 +++++
 11 files changed, 156 insertions(+), 8 deletions(-)

diff --git a/tools/include/xendevicemodel=2Eh b/tools/include/xendevicemod=
el=2Eh
index 698d719119=2E=2E72994d1313 100644
--- a/tools/include/xendevicemodel=2Eh
+++ b/tools/include/xendevicemodel=2Eh
@@ -44,12 +44,13 @@ int xendevicemodel_close(xendevicemodel_handle *dmod);
  * @parm domid the domain id to be serviced
  * @parm handle_bufioreq how should the IOREQ Server handle buffered
  *                       requests (HVM_IOREQSRV_BUFIOREQ_*)?
+ * @parm flags bitmask of XEN_DMOP_IOREQ_SERVER_* capability flags (0 if =
none)=2E
  * @parm id pointer to an ioservid_t to receive the IOREQ Server id=2E
  * @return 0 on success, -1 on failure=2E
  */
 int xendevicemodel_create_ioreq_server(
     xendevicemodel_handle *dmod, domid_t domid, int handle_bufioreq,
-    ioservid_t *id);
+    uint8_t flags, ioservid_t *id);
=20
 /**
  * This function retrieves the necessary information to allow an
diff --git a/tools/libs/ctrl/xc_devicemodel_compat=2Ec b/tools/libs/ctrl/x=
c_devicemodel_compat=2Ec
index a46011cd17=2E=2E91366e250c 100644
--- a/tools/libs/ctrl/xc_devicemodel_compat=2Ec
+++ b/tools/libs/ctrl/xc_devicemodel_compat=2Ec
@@ -11,7 +11,7 @@ int xc_hvm_create_ioreq_server(
     ioservid_t *id)
 {
     return xendevicemodel_create_ioreq_server(xch->dmod, domid,
-                                              handle_bufioreq, id);
+                                              handle_bufioreq, 0, id);
 }
=20
 int xc_hvm_get_ioreq_server_info(
diff --git a/tools/libs/devicemodel/core=2Ec b/tools/libs/devicemodel/core=
=2Ec
index 274a8eb28b=2E=2E5b2acb1869 100644
--- a/tools/libs/devicemodel/core=2Ec
+++ b/tools/libs/devicemodel/core=2Ec
@@ -167,7 +167,7 @@ static int xendevicemodel_op(
=20
 int xendevicemodel_create_ioreq_server(
     xendevicemodel_handle *dmod, domid_t domid, int handle_bufioreq,
-    ioservid_t *id)
+    uint8_t flags, ioservid_t *id)
 {
     struct xen_dm_op op;
     struct xen_dm_op_create_ioreq_server *data;
@@ -179,6 +179,7 @@ int xendevicemodel_create_ioreq_server(
     data =3D &op=2Eu=2Ecreate_ioreq_server;
=20
     data->handle_bufioreq =3D handle_bufioreq;
+    data->flags =3D flags;
=20
     rc =3D xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
     if (rc)
diff --git a/xen/arch/arm/ioreq=2Ec b/xen/arch/arm/ioreq=2Ec
index b4211f0159=2E=2E7d26180926 100644
--- a/xen/arch/arm/ioreq=2Ec
+++ b/xen/arch/arm/ioreq=2Ec
@@ -201,6 +201,12 @@ void arch_ioreq_domain_init(struct domain *d)
 {
 }
=20
+int arch_ioreq_server_create_check(const struct domain *d, unsigned int f=
lags)
+{
+    /* No XEN_DMOP_IOREQ_SERVER_* capability flags are defined for Arm=2E=
 */
+    return flags ? -EINVAL : 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/domain=2Ec b/xen/arch/x86/domain=2Ec
index 996b50af7a=2E=2E69c9093e06 100644
--- a/xen/arch/x86/domain=2Ec
+++ b/xen/arch/x86/domain=2Ec
@@ -25,6 +25,7 @@
 #include <xen/init=2Eh>
 #include <xen/iocap=2Eh>
 #include <xen/iommu=2Eh>
+#include <xen/ioreq=2Eh>
 #include <xen/irq=2Eh>
 #include <xen/kernel=2Eh>
 #include <xen/lib=2Eh>
@@ -1106,7 +1107,19 @@ int arch_domain_soft_reset(struct domain *d)
 void arch_domain_creation_finished(struct domain *d)
 {
     if ( is_hvm_domain(d) )
+    {
+        /*
+         * Latch the extended destination ID decision now that all boot-t=
ime
+         * ioreq servers are registered=2E A value restored from a migrat=
ion
+         * stream (EXT_DEST_ID save record) already fixes it and wins=2E
+         */
+        if ( d->arch=2Ehvm=2Eext_dest_id =3D=3D EXT_DEST_ID_UNSET )
+            d->arch=2Ehvm=2Eext_dest_id =3D hvm_ext_dest_id_enabled(d)
+                                      ? EXT_DEST_ID_ENABLED
+                                      : EXT_DEST_ID_DISABLED;
+
         hvm_domain_creation_finished(d);
+    }
 }
=20
 #ifdef CONFIG_COMPAT
diff --git a/xen/arch/x86/hvm/ioreq=2Ec b/xen/arch/x86/hvm/ioreq=2Ec
index a5fa97e149=2E=2E63d22f6738 100644
--- a/xen/arch/x86/hvm/ioreq=2Ec
+++ b/xen/arch/x86/hvm/ioreq=2Ec
@@ -19,6 +19,7 @@
=20
 #include <asm/hvm/emulate=2Eh>
 #include <asm/hvm/hvm=2Eh>
+#include <asm/hvm/support=2Eh>
 #include <asm/hvm/vmx/vmx=2Eh>
 #include <asm/msr=2Eh>
=20
@@ -325,6 +326,62 @@ void arch_ioreq_domain_init(struct domain *d)
     register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
 }
=20
+int arch_ioreq_server_create_check(const struct domain *d, unsigned int f=
lags)
+{
+    if ( flags & ~XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID )
+        return -EINVAL;
+
+    /*
+     * Once the domain is running with extended destination IDs advertise=
d,
+     * every ioreq server it gains must be able to bind MSIs the new way=
=2E
+     * (Before that point d->arch=2Ehvm=2Eext_dest_id is still UNSET and =
servers
+     * are levelled at arch_domain_creation_finished()=2E)
+     */
+    if ( d->arch=2Ehvm=2Eext_dest_id =3D=3D EXT_DEST_ID_ENABLED &&
+         !(flags & XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) )
+        return -EPERM;
+
+    return 0;
+}
+
+static int cf_check ext_dest_id_save(struct vcpu *v, hvm_domain_context_t=
 *h)
+{
+    struct hvm_hw_ext_dest_id s =3D {
+        =2Eenabled =3D v->domain->arch=2Ehvm=2Eext_dest_id,
+    };
+
+    return hvm_save_entry(EXT_DEST_ID, 0, h, &s);
+}
+
+static int cf_check ext_dest_id_check(const struct domain *d,
+                                      hvm_domain_context_t *h)
+{
+    const struct hvm_hw_ext_dest_id *s =3D hvm_get_entry(EXT_DEST_ID, h);
+
+    if ( !s )
+        return -ENODATA;
+
+    return s->enabled > EXT_DEST_ID_ENABLED ? -EINVAL : 0;
+}
+
+static int cf_check ext_dest_id_load(struct domain *d, hvm_domain_context=
_t *h)
+{
+    struct hvm_hw_ext_dest_id s;
+
+    if ( hvm_load_entry(EXT_DEST_ID, h, &s) )
+        return -ENODATA;
+
+    if ( s=2Eenabled > EXT_DEST_ID_ENABLED )
+        return -EINVAL;
+
+    d->arch=2Ehvm=2Eext_dest_id =3D s=2Eenabled;
+
+    return 0;
+}
+
+HVM_REGISTER_SAVE_RESTORE(EXT_DEST_ID, ext_dest_id_save, ext_dest_id_chec=
k,
+                          ext_dest_id_load, 1, HVMSR_PER_DOM);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/save=2Ec b/xen/arch/x86/hvm/save=2Ec
index 8ab6405706=2E=2Eaac8498049 100644
--- a/xen/arch/x86/hvm/save=2Ec
+++ b/xen/arch/x86/hvm/save=2Ec
@@ -341,6 +341,15 @@ int hvm_load(struct domain *d, bool real, hvm_domain_=
context_t *h)
             /* Reset cursor for hvm_load(, true, )=2E */
             if ( !real )
                 h->cur =3D 0;
+
+            /*
+             * A migration stream from a Xen predating extended destinati=
on IDs
+             * carries no EXT_DEST_ID record, leaving ext_dest_id UNSET h=
ere=2E
+             * Set it to DISABLED then, because the domain has no knowled=
ge
+             * about EXT_DEST_IDs=2E
+             */
+            else if ( d->arch=2Ehvm=2Eext_dest_id =3D=3D EXT_DEST_ID_UNSE=
T )
+                d->arch=2Ehvm=2Eext_dest_id =3D EXT_DEST_ID_DISABLED;
             return 0;
         }
=20
diff --git a/xen/common/ioreq=2Ec b/xen/common/ioreq=2Ec
index f5fd30ce12=2E=2E53003286c4 100644
--- a/xen/common/ioreq=2Ec
+++ b/xen/common/ioreq=2Ec
@@ -79,6 +79,25 @@ static struct ioreq_server *get_ioreq_server(const stru=
ct domain *d,
     return GET_IOREQ_SERVER(d, id);
 }
=20
+bool hvm_ext_dest_id_enabled(const struct domain *d)
+{
+    unsigned int id;
+    bool any =3D false;
+
+    for ( id =3D 0; id < ARRAY_SIZE(d->ioreq_server=2Eserver); id++ )
+    {
+        const struct ioreq_server *s =3D GET_IOREQ_SERVER(d, id);
+
+        if ( !s )
+            continue;
+        if ( !s->ext_dest_id )
+            return false;
+        any =3D true;
+    }
+
+    return any;
+}
+
 /*
  * Iterate over all possible ioreq servers=2E
  *
@@ -641,7 +660,7 @@ static void ioreq_server_deinit(struct ioreq_server *s=
)
 }
=20
 static int ioreq_server_create(struct domain *d, int bufioreq_handling,
-                               ioservid_t *id)
+                               unsigned int flags, ioservid_t *id)
 {
     struct ioreq_server *s;
     unsigned int i;
@@ -683,6 +702,8 @@ static int ioreq_server_create(struct domain *d, int b=
ufioreq_handling,
         goto fail;
     }
=20
+    s->ext_dest_id =3D flags & XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID;
+
     if ( id )
         *id =3D i;
=20
@@ -1350,10 +1371,14 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struc=
t domain *d, bool *const_op)
         *const_op =3D false;
=20
         rc =3D -EINVAL;
-        if ( data->pad[0] || data->pad[1] || data->pad[2] )
+        if ( data->pad[0] || data->pad[1] )
+            break;
+
+        rc =3D arch_ioreq_server_create_check(d, data->flags);
+        if ( rc )
             break;
=20
-        rc =3D ioreq_server_create(d, data->handle_bufioreq,
+        rc =3D ioreq_server_create(d, data->handle_bufioreq, data->flags,
                                  &data->id);
         break;
     }
diff --git a/xen/include/public/arch-x86/hvm/save=2Eh b/xen/include/public=
/arch-x86/hvm/save=2Eh
index ff73b83d65=2E=2E58d301512e 100644
--- a/xen/include/public/arch-x86/hvm/save=2Eh
+++ b/xen/include/public/arch-x86/hvm/save=2Eh
@@ -629,12 +629,26 @@ struct hvm_msr {
=20
 #define CPU_MSR_CODE  20
=20
+/*
+ * Extended (15-bit) MSI / IO-APIC destination ID support, as negotiated =
with
+ * the domain's ioreq servers and latched when the domain starts running=
=2E
+ *
+ * 'enabled' takes the values of enum in struct hvm_domain: 0 =3D undecid=
ed,
+ * 1 =3D off, 2 =3D on=2E
+ */
+struct hvm_hw_ext_dest_id {
+    uint8_t enabled;
+    uint8_t pad[7];
+};
+
+DECLARE_HVM_SAVE_TYPE(EXT_DEST_ID, 21, struct hvm_hw_ext_dest_id);
+
 /* Range 22 - 34 (inclusive) reserved for Amazon */
=20
 /*
  * Largest type-code in use
  */
-#define HVM_SAVE_CODE_MAX 20
+#define HVM_SAVE_CODE_MAX 21
=20
 #endif /* __XEN_PUBLIC_HVM_SAVE_X86_H__ */
=20
diff --git a/xen/include/public/hvm/dm_op=2Eh b/xen/include/public/hvm/dm_=
op=2Eh
index d76777f71f=2E=2E0e1774b1d3 100644
--- a/xen/include/public/hvm/dm_op=2Eh
+++ b/xen/include/public/hvm/dm_op=2Eh
@@ -44,13 +44,24 @@ typedef uint16_t ioservid_t;
  * hvm_op=2Eh=2E If the value is HVM_IOREQSRV_BUFIOREQ_OFF then  the buff=
ered
  * ioreq ring will not be allocated and hence all emulation requests to
  * this server will be synchronous=2E
+ *
+ * x86 HVM only: a server that sets XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID in
+ * <flags> promises to bind every passthrough MSI via XEN_DMOP_bind_pt_ms=
i_irq
+ * (which carries the raw MSI message)=2E Extended (15-bit) MSI / IO-APIC
+ * destination IDs are enabled for the domain, and advertised via
+ * XEN_HVM_CPUID_EXT_DEST_ID, only if *every* ioreq server registered bef=
ore
+ * the domain starts running sets this flag=2E Once the feature is locked=
 in,
+ * later servers that lack the flag are rejected=2E
  */
 #define XEN_DMOP_create_ioreq_server 1
=20
 struct xen_dm_op_create_ioreq_server {
     /* IN - should server handle buffered ioreqs */
     uint8_t handle_bufioreq;
-    uint8_t pad[3];
+    /* IN - XEN_DMOP_IOREQ_SERVER_* */
+    uint8_t flags;
+#define XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID (1u << 0)
+    uint8_t pad[2];
     /* OUT - server id */
     ioservid_t id;
 };
diff --git a/xen/include/xen/ioreq=2Eh b/xen/include/xen/ioreq=2Eh
index e86f0869fa=2E=2Ea75bd04b97 100644
--- a/xen/include/xen/ioreq=2Eh
+++ b/xen/include/xen/ioreq=2Eh
@@ -54,9 +54,19 @@ struct ioreq_server {
     evtchn_port_t          bufioreq_evtchn;
     struct rangeset        *range[NR_IO_RANGE_TYPES];
     bool                   enabled;
+    bool                   ext_dest_id;
     uint8_t                bufioreq_handling;
 };
=20
+/*
+ * True if at least one ioreq server is registered and every registered s=
erver
+ * set XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID=2E Only meaningful before the do=
main
+ * starts running (called from arch_domain_creation_finished(), when no
+ * concurrent ioreq server (de)registration can occur)=2E The result is l=
atched
+ * into d->arch=2Ehvm=2Eext_dest_id there=2E
+ */
+bool hvm_ext_dest_id_enabled(const struct domain *d);
+
 static inline paddr_t ioreq_mmio_first_byte(const ioreq_t *p)
 {
     return unlikely(p->df) ?
@@ -137,6 +147,7 @@ bool arch_ioreq_server_destroy_all(struct domain *d);
 bool arch_ioreq_server_get_type_addr(const struct domain *d, const ioreq_=
t *p,
                                      uint8_t *type, uint64_t *addr);
 void arch_ioreq_domain_init(struct domain *d);
+int arch_ioreq_server_create_check(const struct domain *d, unsigned int f=
lags);
=20
 #endif /* __XEN_IOREQ_H__ */
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35ad.88da934c2c0754a.1a0679edb1d.ec095fd8a6ac7414=---

