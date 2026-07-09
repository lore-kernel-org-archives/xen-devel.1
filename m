Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0617C44501
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 16:19:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358343.1612526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whrSZ-0002CP-4i; Thu, 09 Jul 2026 16:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358343.1612526; Thu, 09 Jul 2026 16:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whrSZ-0002CI-1r; Thu, 09 Jul 2026 16:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1358343;
 Thu, 09 Jul 2026 16:18:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1whrSX-00029Y-Pp
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 16:18:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whrSX-00EFLu-6g
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 18:18:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fc9d4-e002-0a2a0a5209dd-0a2a4509d688-30
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 18:18:44 +0200
Received: from [98.137.66.146] (helo=sonic317-20.consmr.mail.gq1.yahoo.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <brchuckz@aol.com>)
 id 6a4fc9e3-b440-0a2a45090019-62894292ac87-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 18:18:44 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Thu, 9 Jul 2026 16:18:43 +0000
Received: by hermes--production-ne1-7568ccb994-pgg8z (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID e91c25460b5bcef5e32390743f7fb9e1; 
 Thu, 09 Jul 2026 16:18:37 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=aol.com header.i="@aol.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1783613923; bh=6TRFJxdSJpCb8eK0SYeXC8suh+qMlPVnpIC7E7OSPbk=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Nxo4i02hiG/SFTXenFtczYu1QXSOPQlHK4NzODxoaLX8JDMXXcaRN2Aj/6XriWpghNwGUYZE30//ARuxY2ZidxfQByZF/grGIbLTVV/rro/xgFZpg9X4eumsjsMhl464XcRMF3vmoWRHgLUcu5kmiwWWnaN0Q/wuMQ+ViCXN4GoXHJ1IQMBVGPXwjhwYCHIPGDEAufejc+14RGEf1RTF2ZyKMmmqW6XIRF1E2RNTCwyCdENo89fIiY9aOvbRiAfg+vjCNnJL21oIxRl/2mWcDzff7pJfrrWIiUNuA9jyiirJ2zMhKJ+Crmex2C3OTuoK2yY2GZJeDC378gJKYfK5Vg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1783613923; bh=hMCCyBEbqP+T+xxDKbF1RjdxccH3SVHwoVrdLhSo9U2=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=VdnItzd5C1mHvLbaDJXcKCtCxpdE1dRyTe7tAmQD1cUq1siCJHtaB6a7rkWIn0a6nIsg5BFsWQf5kQiTb7uaBxMfyyikU2Tm/+ggrNiOy5/NveL5686IdPBbDJMMXhxwMvs7ed5ZFHci4hRZiEsBSMqwqW0jxtrGxWPLSaWISlpyCZTuKkamavfUXpAb4qKant8OFtzsXyDKb3Kzh/TUDdaX11I4trkYfCDjlLqy5uoqSNg9TgMh4mNazXTgTLwAEhVNUSY6g6/0PA9z27OfmKX/vmX2iYxC6Wz3P6zs7xGmB25qtjNt1g5uYjFV+Sq3YZX40SleWQlfygJf9bhCcg==
X-YMail-OSG: ayEQUawVM1ndHij9dm4UoZG4ICQktaDTj3yE.VyQyBlyBNE1OHkNCsSIFr4wLNO
 YfdZRDFZPogd_pMxi7TYMm7hORCJCBwBtRDVDfYERi_kFA8Sa3PZHHmfDr8eEW_wvxqrkaYFv5Xf
 xg1F9VP1eQgnnfX86aat6jYx2qgkrzhfwGiYdR9We3ifMIMdcgCzFmLkqU5MdUu4XPzBumAPNT_1
 z2zJollycpoVj5ZwkOpe1cnYWapS.KAuJKpJ1WNMA_kdHQyZZ3od.xTuqSSwuCgw3Bl4g_d9Ft9X
 mbzQ5mBOrouGH2xSlnkTbS3JMcx63IDtCD6JTDfuD8gLAbc4UIxRqQB4HZKZggCJembLtcV.0H6D
 baBqtdMJTPUXtsFEwoQOEmpJoW2S5F058izlDTqXUN63AoX0P53HrBhCNep14Y9tWi6c_TUa.Szc
 mmRE4w_YC3g1_AJdnEsSTZJHnA0DUKGfKXFqMuM.0LXyniUNRkJcAIcsv8GKymA4ydUUhLIkncxe
 QHUrzqgfpKU9dvHQHsoowcst1pgA_pGgwnQw5GqQhVbVJ4A.4ajBiQP168tyxoNEmTJQefZmrmNw
 kBHE.WQQ2NGjr49cNphvntbBrgNuflQEQ2kt_Ito4hK7RKmdzDzhY3fLGyLPtfGCpvwL2_XiXj7r
 tQjneKN6YXHMWm2Be4CWBXAbFC7mBgV1mEhBvhy6CmbbSedMU1.1ylbRgmY9sENKKTsezrHanpyk
 icJ58Qb3HR1.9y9V1Sg0tHUxpESw_K6OQCgpPULYyPm02dRQ2M1YSh8yL9WvxVdFanAB7cHgH.TO
 MejoD2I1gVoeZ3kD7FQ1fH8yYDh.6cJ84zk2nJYMRTNBMGrb__N28wtYjTcg9JHSLhNk4qiYD3Je
 0sAXWNYTWERSX8uyIIT.iBDjaxB4Jbg3ggh33cRQDC2GhoDjliVoTcTRXRF0Z.DilFi0gFFISWx0
 yjwqt0PPqZ41q13DTOM98gRIPf7OiX2iyk.VlmPgJDxysD1KYG6fd2icUMhRx5SAoOzFItyg2WY_
 7kmpJd8adPKXUdZSXsKMhkFi2rf2gCwN93rjvG6USbQCS7whjxw2hmrKxlGLLW3tgrf2xR7LQRnD
 .Phg5ahqi507Gs4_Zk4kXHVOK50_.mpW9WQ.xtaRpE8Q4YZt.S8plDnmK7cSTj4gIjEL.xYx.pK1
 wfH7QIhKxSyfs5jCZYhJA97bhrDlKqFkcN2hyAwLIUZdz.mlfT8pqxDZNA.l2K0pZ78iiFP4w0q_
 1XitSrZ0MRkZQRnCuzj7PSf1VHed9ZgENdXIVi7TJVpv.llut9Dv044go29ml8otaYNOPpND4D2h
 Jbf4Q1pxCMQeUH.yURyjqmDZAAm3qFywxGciXBXzGg5hiBq0UOd54oWzEO.1uTRCT2QCUPEsY8Ew
 ufSBU.NHtknkb5EJxx18Tncc6JyKuED4HLxB6VN86nZr19RedPsJQLZNDDfu85itBZpA_j09CwuA
 yTjG4d05vDWraYbALz_dQMKmbWhoPTeXa08Yn2.KfnFzOMXfHLYZCivR5op9_a45uQTFAm8Gcm_8
 uVlj5SSw5qQ1mL45s3aaszxQvNU3xNH8JSpfOPg0pPhMDsWvqbmvO_7IjXKYzq9PK.yqa7Dpqbn7
 mZRqrSgwVoiA2xL8TTgkroK8tphZvgmwqqVgzuVDUO4NzJhaEUKQPEuc5ULmMFSnI3uV7kA157eB
 96.YZfMYPitRP4Tot1QL5H9KDLyZfQmDwpBXBPBCJkamshU2lm4Rrtmp4Up.eiITQHkplKpHF.nP
 PRne4lWrPoHGamB2qzwlEasZdobAAUrg9hefXukQaAoS4D9akaDtDL31BVGIZ1vxV_MPnzySZ7o.
 cAwiw5lvyZmSjasNVFkitth.GN_QAVUyNFNRnKgZusOq6rRguohC8EjJ7njPG86F4BIkE1xLnKge
 U_yOEIgN1vuMhhHz5C3WEnPCDVqtljwf7YxNq5Nr3qE5blfOT2Ck8iyeis4fj5ZDd9N.dI5VrvlT
 0V03hH3LVb3e1GWcqM3uKCweZcGXBOZwWzHwWA9Oc2ocIfl1ZyWj9LLE5UozT5Zh9Jk.DXD1TItG
 AABQj0vh5LgpESep2ebRKI9sZCNa.WVo9WzDzCKK4_lAaF08e6nvDISqvaKyr5j5VXwtYZduw.Wp
 SsVbRKyXziTAVU7A7OBTN80o_PSOb0x1XL57hpzmFxafYl8eGm9JD1VCE2GTN63mT4XitEccCd92
 FW5vwrSgs2WxpDJAUKiExJJVB4VoZAXFC4c_RUyWt
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 140ad6a4-b874-48a0-97f0-3f602f31e683
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 2/3] xen/igd: don't register rom bar twice
Date: Thu,  9 Jul 2026 12:18:30 -0400
Message-ID: <20260709161831.17753-3-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709161831.17753-1-brchuckz@aol.com>
References: <20260709161831.17753-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1783613924-5C57BA0B-0EEE5129/0/0
X-purgate-type: clean
X-purgate-size: 1430

This also fixes a failed assertion in pci [1] for Qemu
version 10 and higher when passing through an Intel
IGD with an option ROM to the guest.

[1] f6fc01c ("hw/pci: Assert a bar is not registered multiple times")

Fixes: 881213f ("xen, gfx passthrough: retrieve VGA BIOS to work")
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v2:
  - get 'pcibus_t romsize' instead of 'PCIIORegion region'
  - move definition of romsize to the top of the function
    and make it constant
  - add stable to Cc list

 hw/xen/xen_pt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 474606e..8b30b61 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -459,6 +459,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
 {
     int i = 0;
     XenHostPCIDevice *d = &s->real_device;
+    const pcibus_t romsize = s->dev.io_regions[PCI_ROM_SLOT].size;
 
     /* Register PIO/MMIO BARs */
     for (i = 0; i < PCI_ROM_SLOT; i++) {
@@ -495,7 +496,7 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
     }
 
     /* Register expansion ROM address */
-    if (d->rom.base_addr && d->rom.size) {
+    if (!romsize && d->rom.base_addr && d->rom.size) {
         uint32_t bar_data = 0;
 
         /* Re-set BAR reported by OS, otherwise ROM can't be read. */
-- 
2.52.0


