Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4920C624DE
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407264.1640408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D9-0007I9-Qf; Thu, 03 Sep 2026 14:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407264.1640408; Thu, 03 Sep 2026 14:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D9-0007Hp-MJ; Thu, 03 Sep 2026 14:14:39 +0000
Received: by outflank-mailman (input) for mailman id 1407264;
 Thu, 03 Sep 2026 14:14:38 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679edb8f000c4f3@swg.vates.tech>)
 id 1x28D8-00078B-Dn
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28D7-001HAI-Qu
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:37 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679edb8f000c4f3@swg.vates.tech>)
 id 6a9980bd-2eae-0a2a0a5409dd-0a2a4505c668-36
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:37 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679edb8f000c4f3@swg.vates.tech>)
 id 6a9980cb-4cb1-0a2a45050019-b9ff1c228579-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679edb8f000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:19 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7E94984012;
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
 q=dns/txt; s=selector1; bh=wLovsWfA/SxNUKrf8umHetWd6JDKT68QQwT/Ms2jeAk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nP/sr+vGFFJkyZ1VAg1SeINQH707ziL54maQHXOn7GQMnHAqtoCFWamVjGWkxEOkPvj+TVt0R
 KRD7haz3aps6W8Cb2b7pSCTD47WerHMg1zja7TAedeDxKAM/nb6cFCNW672KW/PfFqZuzoZH5D+
 ruI6L2h3485vn9z++x6LYq5V9FEMgaX+cZB1e5QxumEUuxAYWRfJyUDhk89+LlnXgE1ErgR1RyT
 7rDBcJOkjXbQ/aJhab8N2BJgDJKlcp1xOIe2fX1AsS05iJ8O+rYmv7Fwec3Zcur7B41Vf4C4YSW
 yNwGmHK+VRDACtBNYmzxwaKjSR5M13AHdAneSFqROsHA==
X-Zone-Loop: 7533775c6bc53995e4466ee2d95ddc3d244e45d80323
x-campaign-type: default
x-transaction-id: 7c40deaf-f49d-44da-93ee-702d62ae6c1e
x-swg-uid: 01-58aa0035-e02e-4b8b-aaaa-cff792b813e4
X-Mailer: Sweego
Message-ID:
 <1788444859.8631fc262581453bbf619ec5b2062170.1a0679edb8f000c4f3@vates.tech>
x-swg-bid: 1788444859.8631fc262581453bbf619ec5b2062170.1a0679edb8f000c4f3
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
Subject: [PATCH v5 09/11] x86/dmop: Add XEN_DMOP_{,un}bind_pt_msi_irq
Date: Thu,  3 Sep 2026 16:14:07 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35ac.4cbeb03216e9d1fc.1a0679ed967.91135d8424a5c29e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444858727
X-purgate-ID: tlsNG-c201ff/1788444877-730B22A1-2246DCEF/0/0
X-purgate-type: clean
X-purgate-size: 21254

---=Part.35ac.4cbeb03216e9d1fc.1a0679ed967.91135d8424a5c29e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add two device-model ops that bind / unbind a passthrough interrupt to a
guest MSI from the raw MSI message (address + data) the guest
programmed=2E Xen decodes the message itself via pt_irq_bind_msi(), so the
emulator needs no knowledge of the MSI layout and, in particular,
extended (15-bit) destination IDs are handled without emulator changes=2E

The MSI-X table base is passed as a guest-physical address=2E Fields are
named msg_addr / msg_data / pirq, and the flag is
XEN_DMOP_MSI_BIND_UNMASKED=2E The unbind op only requires a valid pirq
mapping, not current IRQ permission, so an emulator can remove a binding
even after the device has been deassigned=2E

With this in place, PT_IRQ_TYPE_MSI is removed from
XEN_DOMCTL_{,un}bind_pt_irq (returns -EINVAL) and from
pt_irq_create_bind()=2E libxc's xc_domain_{update,unbind}_msi_irq() and
vPCI already funnel through pt_irq_bind_msi()=2E This is an incompatible
change for device models still using the domctl sub-case (noted in
CHANGELOG=2Emd and public/domctl=2Eh)=2E

libxendevicemodel gains xendevicemodel_{,un}bind_pt_msi_irq() (map
version VERS_1=2E5)=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Retitled to "{,un}bind_pt_msi_irq"=2E
- Struct/flag renamed: pirq (was machine_irq), msg_addr / msg_data (was
  addr / data), XEN_DMOP_MSI_BIND_UNMASKED (was
  XEN_DMOP_MSI_FLAG_UNMASKED)=2E
- Documented gtable as a guest-physical address=2E
- Diagnostics shortened to "%pd: fn() failed: %ld"=2E
- The unbind op drops the current-domain IRQ-permission check, so an
  emulator can unbind after the device has been deassigned=2E
- Comment added noting access is gated by xsm_dm_op()=2E
- This patch now also removes PT_IRQ_TYPE_MSI: a hard -EINVAL from
  XEN_DOMCTL_{,un}bind_pt_irq (not -EOPNOTSUPP) and deletion of the
  now-dead case from pt_irq_create_bind()
- Incompatible changes are recorded in CHANGELOG=2Emd and public/domctl=2E=
h=2E
- Added the missing libxendevicemodel=2Emap VERS_1=2E5 entry and Makefile
  MINOR bump=2E v4 never exported the new symbols=2E
- Stale XEN_DMOP_enable_ext_dest_id #define and a stray blank line
  before a typedef removed=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 CHANGELOG=2Emd                                 |  6 ++
 tools/include/xendevicemodel=2Eh               | 30 +++++++++
 tools/libs/ctrl/xc_domain=2Ec                  | 51 +++++++--------
 tools/libs/devicemodel/Makefile              |  2 +-
 tools/libs/devicemodel/core=2Ec                | 38 +++++++++++
 tools/libs/devicemodel/libxendevicemodel=2Emap |  6 ++
 xen/arch/x86/domctl=2Ec                        | 11 +++-
 xen/arch/x86/hvm/dm=2Ec                        | 66 ++++++++++++++++++++
 xen/drivers/passthrough/x86/hvm=2Ec            | 35 +----------
 xen/include/public/hvm/dm_op=2Eh               | 38 +++++++++++
 xen/include/xlat=2Elst                         |  2 +
 11 files changed, 221 insertions(+), 64 deletions(-)

diff --git a/CHANGELOG=2Emd b/CHANGELOG=2Emd
index aa1a777dd4=2E=2E76f5d06c91 100644
--- a/CHANGELOG=2Emd
+++ b/CHANGELOG=2Emd
@@ -34,6 +34,9 @@ The format is based on [Keep a Changelog](https://keepac=
hangelog=2Ecom/en/1=2E0=2E0/)
  - On x86:
    - Enable pf-fixup option by default for PVH dom0=2E
    - The libxenguest bzImage loader now uses the system liblz4 library=2E
+   - XEN_DOMCTL_{,un}bind_pt_irq no longer accept PT_IRQ_TYPE_MSI, device
+     models must bind passthrough MSIs via the new
+     XEN_DMOP_{,un}bind_pt_msi_irq, which carry the raw MSI message=2E
=20
 ### Added
  - Support for per-domain Xenstore quota in C xenstored (includes
@@ -47,6 +50,9 @@ The format is based on [Keep a Changelog](https://keepac=
hangelog=2Ecom/en/1=2E0=2E0/)
    - Support for CPIO microcode in discrete multiboot modules=2E
    - Introduce get-core-temp command to xenpm to query CPU temperatures o=
n
      Intel platforms=2E
+   - XEN_DMOP_{,un}bind_pt_msi_irq for binding passthrough MSIs from the =
raw
+     guest MSI message, enabling extended (15-bit) destination IDs for HV=
M
+     guests whose device models opt in=2E
=20
  - On Arm:
    - Support for guest suspend and resume to/from RAM via vPSCI=2E
diff --git a/tools/include/xendevicemodel=2Eh b/tools/include/xendevicemod=
el=2Eh
index 227e7fd810=2E=2E698d719119 100644
--- a/tools/include/xendevicemodel=2Eh
+++ b/tools/include/xendevicemodel=2Eh
@@ -375,6 +375,36 @@ int xendevicemodel_nr_vcpus(
  */
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid);
=20
+/**
+ * This function binds a passthrough interrupt to a guest MSI, described =
by the
+ * raw MSI message (address and data) the guest programmed=2E Xen decodes=
 the
+ * message itself, so the caller does not need to interpret it=2E
+ *
+ * @parm dmod a handle to an open devicemodel interface=2E
+ * @parm domid the domain id to be serviced=2E
+ * @parm pirq the pass-through IRQ (pirq)=2E
+ * @parm msg_addr the MSI message address, as programmed by the guest=2E
+ * @parm msg_data the MSI message data, as programmed by the guest=2E
+ * @parm gtable the MSI-X table base guest-physical address, or 0 for pla=
in MSI=2E
+ * @parm unmasked if non-zero, leave the IRQ unmasked after binding=2E
+ * @return 0 on success, -1 on failure=2E
+ */
+int xendevicemodel_bind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t pirq,
+    uint64_t msg_addr, uint32_t msg_data, uint64_t gtable, int unmasked);
+
+/**
+ * This function unbinds a passthrough interrupt previously bound with
+ * xendevicemodel_bind_pt_msi_irq=2E
+ *
+ * @parm dmod a handle to an open devicemodel interface=2E
+ * @parm domid the domain id to be serviced=2E
+ * @parm pirq the pass-through IRQ (pirq)=2E
+ * @return 0 on success, -1 on failure=2E
+ */
+int xendevicemodel_unbind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t pirq);
+
 #endif /* XENDEVICEMODEL_H */
=20
 /*
diff --git a/tools/libs/ctrl/xc_domain=2Ec b/tools/libs/ctrl/xc_domain=2Ec
index 94cfab0fa1=2E=2Eb4eed42f97 100644
--- a/tools/libs/ctrl/xc_domain=2Ec
+++ b/tools/libs/ctrl/xc_domain=2Ec
@@ -1677,6 +1677,21 @@ int xc_deassign_dt_device(
=20
=20
=20
+static void xc_msi_gflags_to_addr_data(uint32_t gvec, uint32_t gflags,
+                                        uint64_t *msi_addr, uint32_t *msi=
_data)
+{
+    *msi_addr =3D 0xfee00000U |
+        ((uint64_t)((gflags & XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) << 12)) |
+        (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK ? (1U << 3) : 0) |
+        (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK ? (1U << 2) : 0);
+
+    *msi_data =3D (gvec & 0xff) |
+        (uint32_t)(((gflags & XEN_DOMCTL_VMSI_X86_DELIV_MASK) >>
+                    (/* shift of XEN_DOMCTL_VMSI_X86_DELIV_MASK */ 12 -
+                     /* MSI data delivery shift */ 8))) |
+        (gflags & XEN_DOMCTL_VMSI_X86_TRIG_MASK ? (1U << 15) : 0);
+}
+
 int xc_domain_update_msi_irq(
     xc_interface *xch,
     uint32_t domid,
@@ -1685,22 +1700,14 @@ int xc_domain_update_msi_irq(
     uint32_t gflags,
     uint64_t gtable)
 {
-    int rc;
-    struct xen_domctl_bind_pt_irq *bind;
-    struct xen_domctl domctl =3D {};
-
-    domctl=2Ecmd =3D XEN_DOMCTL_bind_pt_irq;
-    domctl=2Edomain =3D domid;
+    uint64_t msi_addr;
+    uint32_t msi_data;
=20
-    bind =3D &(domctl=2Eu=2Ebind_pt_irq);
-    bind->irq_type =3D PT_IRQ_TYPE_MSI;
-    bind->machine_irq =3D pirq;
-    bind->u=2Emsi=2Egvec =3D gvec;
-    bind->u=2Emsi=2Egflags =3D gflags;
-    bind->u=2Emsi=2Egtable =3D gtable;
+    xc_msi_gflags_to_addr_data(gvec, gflags, &msi_addr, &msi_data);
=20
-    rc =3D do_domctl(xch, &domctl);
-    return rc;
+    return xendevicemodel_bind_pt_msi_irq(xch->dmod, domid, pirq,
+                                          msi_addr, msi_data, gtable,
+                                          gflags & XEN_DOMCTL_VMSI_X86_UN=
MASKED);
 }
=20
 int xc_domain_unbind_msi_irq(
@@ -1710,21 +1717,7 @@ int xc_domain_unbind_msi_irq(
     uint32_t pirq,
     uint32_t gflags)
 {
-    int rc;
-    struct xen_domctl_bind_pt_irq *bind;
-    struct xen_domctl domctl =3D {};
-
-    domctl=2Ecmd =3D XEN_DOMCTL_unbind_pt_irq;
-    domctl=2Edomain =3D domid;
-
-    bind =3D &(domctl=2Eu=2Ebind_pt_irq);
-    bind->irq_type =3D PT_IRQ_TYPE_MSI;
-    bind->machine_irq =3D pirq;
-    bind->u=2Emsi=2Egvec =3D gvec;
-    bind->u=2Emsi=2Egflags =3D gflags;
-
-    rc =3D do_domctl(xch, &domctl);
-    return rc;
+    return xendevicemodel_unbind_pt_msi_irq(xch->dmod, domid, pirq);
 }
=20
 /* Pass-through: binds machine irq to guests irq */
diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Make=
file
index 20d1d112e7=2E=2E270bb6c89f 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT =3D $(CURDIR)/=2E=2E/=2E=2E/=2E=2E
 include $(XEN_ROOT)/tools/Rules=2Emk
=20
 MAJOR    =3D 1
-MINOR    =3D 4
+MINOR    =3D 5
 version-script :=3D libxendevicemodel=2Emap
=20
 include Makefile=2Ecommon
diff --git a/tools/libs/devicemodel/core=2Ec b/tools/libs/devicemodel/core=
=2Ec
index 8e619eeb0a=2E=2E274a8eb28b 100644
--- a/tools/libs/devicemodel/core=2Ec
+++ b/tools/libs/devicemodel/core=2Ec
@@ -645,6 +645,44 @@ int xendevicemodel_nr_vcpus(
     return 0;
 }
=20
+int xendevicemodel_bind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t pirq,
+    uint64_t msg_addr, uint32_t msg_data, uint64_t gtable, int unmasked)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_bind_pt_msi_irq *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op=2Eop =3D XEN_DMOP_bind_pt_msi_irq;
+    data =3D &op=2Eu=2Ebind_pt_msi_irq;
+
+    data->pirq =3D pirq;
+    data->msg_data =3D msg_data;
+    data->msg_addr =3D msg_addr;
+    data->gtable =3D gtable;
+    if ( unmasked )
+        data->flags |=3D XEN_DMOP_MSI_BIND_UNMASKED;
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
+int xendevicemodel_unbind_pt_msi_irq(
+    xendevicemodel_handle *dmod, domid_t domid, uint32_t pirq)
+{
+    struct xen_dm_op op;
+    struct xen_dm_op_unbind_pt_msi_irq *data;
+
+    memset(&op, 0, sizeof(op));
+
+    op=2Eop =3D XEN_DMOP_unbind_pt_msi_irq;
+    data =3D &op=2Eu=2Eunbind_pt_msi_irq;
+
+    data->pirq =3D pirq;
+
+    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
+}
+
 int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid)
 {
     return osdep_xendevicemodel_restrict(dmod, domid);
diff --git a/tools/libs/devicemodel/libxendevicemodel=2Emap b/tools/libs/d=
evicemodel/libxendevicemodel=2Emap
index f7f9e3d932=2E=2Ec34b66004e 100644
--- a/tools/libs/devicemodel/libxendevicemodel=2Emap
+++ b/tools/libs/devicemodel/libxendevicemodel=2Emap
@@ -44,3 +44,9 @@ VERS_1=2E4 {
 		xendevicemodel_set_irq_level;
 		xendevicemodel_nr_vcpus;
 } VERS_1=2E3;
+
+VERS_1=2E5 {
+	global:
+		xendevicemodel_bind_pt_msi_irq;
+		xendevicemodel_unbind_pt_msi_irq;
+} VERS_1=2E4;
diff --git a/xen/arch/x86/domctl=2Ec b/xen/arch/x86/domctl=2Ec
index 51d62617bb=2E=2E9846df4f88 100644
--- a/xen/arch/x86/domctl=2Ec
+++ b/xen/arch/x86/domctl=2Ec
@@ -622,6 +622,15 @@ long arch_do_domctl(
         if ( !is_hvm_domain(d) )
             break;
=20
+        /*
+         * PT_IRQ_TYPE_MSI is no longer supported here: it can only conve=
y an
+         * 8-bit destination ID=2E Emulators must use XEN_DMOP_bind_pt_ms=
i_irq,
+         * which passes the raw MSI message so Xen can decode it (extende=
d
+         * destination IDs included)=2E
+         */
+        if ( bind->irq_type =3D=3D PT_IRQ_TYPE_MSI )
+            break;
+
         ret =3D xsm_bind_pt_irq(XSM_DM_PRIV, d, bind);
         if ( ret )
             break;
@@ -657,7 +666,7 @@ long arch_do_domctl(
         int irq =3D domain_pirq_to_irq(d, bind->machine_irq);
=20
         ret =3D -EINVAL;
-        if ( !is_hvm_domain(d) )
+        if ( !is_hvm_domain(d) || bind->irq_type =3D=3D PT_IRQ_TYPE_MSI )
             break;
=20
         ret =3D xsm_unbind_pt_irq(XSM_DM_PRIV, d, bind);
diff --git a/xen/arch/x86/hvm/dm=2Ec b/xen/arch/x86/hvm/dm=2Ec
index 91f6ca669b=2E=2E9a6347e873 100644
--- a/xen/arch/x86/hvm/dm=2Ec
+++ b/xen/arch/x86/hvm/dm=2Ec
@@ -7,6 +7,8 @@
 #include <xen/guest_access=2Eh>
 #include <xen/dm=2Eh>
 #include <xen/hypercall=2Eh>
+#include <xen/iocap=2Eh>
+#include <xen/iommu=2Eh>
 #include <xen/ioreq=2Eh>
 #include <xen/nospec=2Eh>
 #include <xen/sched=2Eh>
@@ -350,6 +352,8 @@ int dm_op(const struct dmop_args *op_args)
         [XEN_DMOP_relocate_memory]                  =3D sizeof(struct xen=
_dm_op_relocate_memory),
         [XEN_DMOP_pin_memory_cacheattr]             =3D sizeof(struct xen=
_dm_op_pin_memory_cacheattr),
         [XEN_DMOP_nr_vcpus]                         =3D sizeof(struct xen=
_dm_op_nr_vcpus),
+        [XEN_DMOP_bind_pt_msi_irq]                  =3D sizeof(struct xen=
_dm_op_bind_pt_msi_irq),
+        [XEN_DMOP_unbind_pt_msi_irq]                =3D sizeof(struct xen=
_dm_op_unbind_pt_msi_irq),
     };
=20
     rc =3D rcu_lock_remote_domain_by_id(op_args->domid, &d);
@@ -617,6 +621,66 @@ int dm_op(const struct dmop_args *op_args)
         break;
     }
=20
+    case XEN_DMOP_bind_pt_msi_irq:
+    {
+        const struct xen_dm_op_bind_pt_msi_irq *data =3D &op=2Eu=2Ebind_p=
t_msi_irq;
+        int irq =3D domain_pirq_to_irq(d, data->pirq);
+
+        rc =3D -EINVAL;
+        if ( data->pad || (data->flags & ~XEN_DMOP_MSI_BIND_UNMASKED) )
+            break;
+
+        /* Access is otherwise gated by xsm_dm_op() at the top of dm_op()=
=2E */
+        rc =3D -EPERM;
+        if ( irq <=3D 0 || !irq_access_permitted(current->domain, irq) )
+            break;
+
+        rc =3D -ESRCH;
+        if ( is_iommu_enabled(d) )
+        {
+            read_lock(&d->pci_lock);
+            rc =3D pt_irq_bind_msi(d, data->pirq, data->msg_addr, data->m=
sg_data,
+                                 data->gtable,
+                                 data->flags & XEN_DMOP_MSI_BIND_UNMASKED=
);
+            read_unlock(&d->pci_lock);
+        }
+        if ( rc < 0 )
+            printk(XENLOG_G_ERR "%pd: pt_irq_bind_msi() failed: %ld\n", d=
, rc);
+        break;
+    }
+
+    case XEN_DMOP_unbind_pt_msi_irq:
+    {
+        const struct xen_dm_op_unbind_pt_msi_irq *data =3D
+            &op=2Eu=2Eunbind_pt_msi_irq;
+        struct xen_domctl_bind_pt_irq bind =3D {
+            =2Emachine_irq =3D data->pirq,
+            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+        };
+        int irq =3D domain_pirq_to_irq(d, data->pirq);
+
+        /*
+         * Only require a valid pirq mapping, not current permission over=
 it:
+         * the emulator must be able to tear the binding down even after =
the
+         * device (and its IRQ) has been deassigned=2E
+         */
+        rc =3D -EPERM;
+        if ( irq <=3D 0 )
+            break;
+
+        rc =3D -ESRCH;
+        if ( is_iommu_enabled(d) )
+        {
+            read_lock(&d->pci_lock);
+            rc =3D pt_irq_destroy_bind(d, &bind);
+            read_unlock(&d->pci_lock);
+        }
+        if ( rc < 0 )
+            printk(XENLOG_G_ERR "%pd: pt_irq_destroy_bind() failed: %ld\n=
",
+                   d, rc);
+        break;
+    }
+
     default:
         rc =3D ioreq_server_dm_op(&op, d, &const_op);
         break;
@@ -653,6 +717,8 @@ CHECK_dm_op_remote_shutdown;
 CHECK_dm_op_relocate_memory;
 CHECK_dm_op_pin_memory_cacheattr;
 CHECK_dm_op_nr_vcpus;
+CHECK_dm_op_bind_pt_msi_irq;
+CHECK_dm_op_unbind_pt_msi_irq;
=20
 int compat_dm_op(
     domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PARAM(void) buf=
s)
diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index a13dd86610=2E=2Ec5d74fcebf 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -449,37 +449,6 @@ int pt_irq_create_bind(
=20
     switch ( pt_irq_bind->irq_type )
     {
-    case PT_IRQ_TYPE_MSI:
-    {
-        unsigned int gflags =3D pt_irq_bind->u=2Emsi=2Egflags;
-        uint64_t msi_addr;
-        uint32_t msi_data;
-
-        /*
-         * Rebuild a raw MSI message from the pre-decoded domctl gflags s=
o the
-         * canonical bind path can decode it uniformly=2E This legacy pat=
h never
-         * carries extended destination ID bits=2E
-         */
-        msi_addr =3D MSI_ADDR_HEADER |
-                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DEST_I=
D_MASK),
-                             MSI_ADDR_DEST_ID_MASK) |
-                   (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK
-                    ? MSI_ADDR_REDIRECTION_LOWPRI
-                    : MSI_ADDR_REDIRECTION_CPU) |
-                   (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK
-                    ? MSI_ADDR_DESTMODE_LOGIC
-                    : MSI_ADDR_DESTMODE_PHYS);
-        msi_data =3D MASK_INSR(pt_irq_bind->u=2Emsi=2Egvec, MSI_DATA_VECT=
OR_MASK) |
-                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DELIV_=
MASK),
-                             MSI_DATA_DELIVERY_MODE_MASK) |
-                   (gflags & XEN_DOMCTL_VMSI_X86_TRIG_MASK
-                    ? MSI_DATA_TRIGGER_LEVEL : 0);
-
-        return pt_irq_bind_msi(d, pt_irq_bind->machine_irq, msi_addr, msi=
_data,
-                               pt_irq_bind->u=2Emsi=2Egtable,
-                               gflags & XEN_DOMCTL_VMSI_X86_UNMASKED);
-    }
-
     case PT_IRQ_TYPE_PCI:
     case PT_IRQ_TYPE_MSI_TRANSLATE:
     {
@@ -767,8 +736,8 @@ int pt_irq_destroy_bind(
         msixtbl_pt_unregister(d, pirq);
         pirq_dpci->flags =3D 0;
         /*
-         * See comment in pt_irq_create_bind's PT_IRQ_TYPE_MSI before the
-         * call to pt_pirq_softirq_reset=2E
+         * See the comment in pt_irq_bind_msi() before its call to
+         * pt_pirq_softirq_reset=2E
          */
         pt_pirq_softirq_reset(pirq_dpci);
=20
diff --git a/xen/include/public/hvm/dm_op=2Eh b/xen/include/public/hvm/dm_=
op=2Eh
index 2bf0fdc1ae=2E=2Ed76777f71f 100644
--- a/xen/include/public/hvm/dm_op=2Eh
+++ b/xen/include/public/hvm/dm_op=2Eh
@@ -444,6 +444,42 @@ struct xen_dm_op_nr_vcpus {
 };
 typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
=20
+/*
+ * XEN_DMOP_bind_pt_msi_irq: bind a passthrough interrupt to a guest MSI,
+ * described by the raw MSI message (address and data) the guest programm=
ed=2E
+ * Xen decodes the message itself, so the emulator does not need to know =
the
+ * MSI layout and, in particular, extended destination IDs are handled
+ * transparently=2E
+ */
+#define XEN_DMOP_bind_pt_msi_irq   21
+
+struct xen_dm_op_bind_pt_msi_irq {
+    /* IN - pirq */
+    uint32_t pirq;
+    /* IN - MSI message data word */
+    uint32_t msg_data;
+    /* IN - bind flags */
+    uint32_t flags;
+#define XEN_DMOP_MSI_BIND_UNMASKED (1u << 0)
+    uint32_t pad;
+    /* IN - MSI message address */
+    uint64_aligned_t msg_addr;
+    /* IN - MSI-X table base address (guest physical), 0 for plain MSI */
+    uint64_aligned_t gtable;
+};
+typedef struct xen_dm_op_bind_pt_msi_irq xen_dm_op_bind_pt_msi_irq_t;
+
+/*
+ * XEN_DMOP_unbind_pt_msi_irq: undo a previous XEN_DMOP_bind_pt_msi_irq=
=2E
+ */
+#define XEN_DMOP_unbind_pt_msi_irq 22
+
+struct xen_dm_op_unbind_pt_msi_irq {
+    /* IN - pirq */
+    uint32_t pirq;
+};
+typedef struct xen_dm_op_unbind_pt_msi_irq xen_dm_op_unbind_pt_msi_irq_t;
+
 struct xen_dm_op {
     uint32_t op;
     uint32_t pad;
@@ -468,6 +504,8 @@ struct xen_dm_op {
         xen_dm_op_relocate_memory_t relocate_memory;
         xen_dm_op_pin_memory_cacheattr_t pin_memory_cacheattr;
         xen_dm_op_nr_vcpus_t nr_vcpus;
+        xen_dm_op_bind_pt_msi_irq_t bind_pt_msi_irq;
+        xen_dm_op_unbind_pt_msi_irq_t unbind_pt_msi_irq;
     } u;
 };
=20
diff --git a/xen/include/xlat=2Elst b/xen/include/xlat=2Elst
index 33dc8e2b2a=2E=2E7255f4c65d 100644
--- a/xen/include/xlat=2Elst
+++ b/xen/include/xlat=2Elst
@@ -98,6 +98,7 @@
 ?	grant_entry_v2			grant_table=2Eh
=20
 !	dm_op_buf			hvm/dm_op=2Eh
+?	dm_op_bind_pt_msi_irq		hvm/dm_op=2Eh
 ?	dm_op_create_ioreq_server	hvm/dm_op=2Eh
 ?	dm_op_destroy_ioreq_server	hvm/dm_op=2Eh
 ?	dm_op_get_ioreq_server_info	hvm/dm_op=2Eh
@@ -116,6 +117,7 @@
 ?	dm_op_set_pci_intx_level	hvm/dm_op=2Eh
 ?	dm_op_set_pci_link_route	hvm/dm_op=2Eh
 ?	dm_op_track_dirty_vram		hvm/dm_op=2Eh
+?	dm_op_unbind_pt_msi_irq		hvm/dm_op=2Eh
=20
 !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op=2Eh
=20
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35ac.4cbeb03216e9d1fc.1a0679ed967.91135d8424a5c29e=---

