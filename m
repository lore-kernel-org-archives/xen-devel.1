Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B83C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407269.1640426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28DE-0007yF-Ol; Thu, 03 Sep 2026 14:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407269.1640426; Thu, 03 Sep 2026 14:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28DE-0007y2-KH; Thu, 03 Sep 2026 14:14:44 +0000
Received: by outflank-mailman (input) for mailman id 1407269;
 Thu, 03 Sep 2026 14:14:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ede0d000c4f3@swg.vates.tech>)
 id 1x28DE-0007wI-3d
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28DD-001HAI-GD
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ede0d000c4f3@swg.vates.tech>)
 id 6a9980bd-2eae-0a2a0a5409dd-0a2a4505c668-46
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:43 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ede0d000c4f3@swg.vates.tech>)
 id 6a9980cb-4cb1-0a2a45050019-b9ff1c228579-6
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ede0d000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:19 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 462F684017;
 Thu,  3 Sep 2026 16:14:19 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=oWieLxc234k5uH169K+pisoqXQICUG6e/oesPGrXHLk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=DZ0uyy0jO63ngUNEYoK2Dh2QPQrjgBPyMLXupjtf2AITZcUkxhYdJ07dwrpvEIv2zOmPfW/3t
 06O/Pz9U3J4YnwlFladbJhiF1sMONN9+XMPjTPhDmuEERa86wW4CMvsQ6MROo1yKcL1GYN14xUu
 2eCIWYQ8+FItbHVxKMnVarw5BCJvfH82PPb96v+1kO8kEvGWrj2QGl1cU2TFzNCcKC+IkwybyWH
 AVGml618nrTTTcT+kxG9Vd9JeNPqPFfoMSyxOcZqs8Eu/arNmha0TD0hiH//xQARhJLL5PV9eRp
 fMSx7xqS5i8SVjOWi2GEgg8Uyh3SAKcn/O6Bg8Ya3tRQ==
X-Zone-Loop: c9557038a1ecc87329f44ca244c39a867c93183a5dac
x-campaign-type: default
x-transaction-id: ae0a429b-35e3-4a3a-9c93-10ddf3fcd485
x-swg-uid: 01-855ebf8e-114e-4bcb-b2a7-08b977133bec
X-Mailer: Sweego
Message-ID:
 <1788444859.8631fc262581453bbf619ec5b2062170.1a0679ede0d000c4f3@vates.tech>
x-swg-bid: 1788444859.8631fc262581453bbf619ec5b2062170.1a0679ede0d000c4f3
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
Subject: [PATCH v5 11/11] x86/cpuid: Advertise XEN_HVM_CPUID_EXT_DEST_ID
Date: Thu,  3 Sep 2026 16:14:09 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35ae.99efa79bcd8cdbfb.1a0679edc75.1550d244ce0da3c1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444859509
X-purgate-ID: tlsNG-c201ff/1788444883-F70B22A1-C8EB1064/0/0
X-purgate-type: clean
X-purgate-size: 2203

---=Part.35ae.99efa79bcd8cdbfb.1a0679edc75.1550d244ce0da3c1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Expose the extended-destination-ID feature bit in the HVM hypervisor
CPUID leaf when d->arch=2Ehvm=2Eext_dest_id is EXT_DEST_ID_ENABLED, i=2Ee=
=2E the
domain's ioreq servers all opted in and the value was latched at
creation_finished (or restored from migration)=2E

An older device model that never sets XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID
leaves the bit clear and the guest keeps 8-bit APIC destination IDs=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Retitled (dropped "when device model opts in")=2E
- Removed the dynamic pre-creation_finished path: guest_cpuid() only
  ever runs for "current", so the value is always latched by the time
  the leaf is read=2E The check is now just hvm_ext_dest_id_active(d)=2E
- Commit message rewritten to match the new logic=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/arch/x86/cpuid=2Ec | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/x86/cpuid=2Ec b/xen/arch/x86/cpuid=2Ec
index a9aeb2d268=2E=2E1e8dbf8a15 100644
--- a/xen/arch/x86/cpuid=2Ec
+++ b/xen/arch/x86/cpuid=2Ec
@@ -148,6 +148,14 @@ static void cpuid_hypervisor_leaves(const struct vcpu=
 *v, uint32_t leaf,
         res->a |=3D XEN_HVM_CPUID_DOMID_PRESENT;
         res->c =3D d->domain_id;
=20
+        /*
+         * Advertise extended (15-bit) MSI / IO-APIC destination IDs when=
 the
+         * feature was negotiated with the domain's device model(s) and l=
atched
+         * at creation_finished (see hvm_ext_dest_id_enabled())=2E
+         */
+        if ( hvm_ext_dest_id_active(d) )
+            res->a |=3D XEN_HVM_CPUID_EXT_DEST_ID;
+
         /*
          * Per-vCPU event channel upcalls are implemented and work
          * correctly with PIRQs routed over event channels=2E
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35ae.99efa79bcd8cdbfb.1a0679edc75.1550d244ce0da3c1=---

