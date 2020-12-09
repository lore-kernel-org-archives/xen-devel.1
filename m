Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC843C4361B
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 08:34:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AAF22473
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 08:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35AAF22473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48032.84958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmuuy-00040J-0L; Wed, 09 Dec 2020 08:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48032.84958; Wed, 09 Dec 2020 08:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmuux-00040C-Sr; Wed, 09 Dec 2020 08:33:47 +0000
Received: by outflank-mailman (input) for mailman id 48032;
 Wed, 09 Dec 2020 08:33:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FZAR=FN=kaod.org=clg@srs-us1.protection.inumbo.net>)
 id 1kmuuv-000407-VM
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 08:33:45 +0000
Received: from 8.mo51.mail-out.ovh.net (unknown [46.105.45.231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3368b96f-7108-4f7a-b1c9-48dd7800cb85;
 Wed, 09 Dec 2020 08:33:44 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id AF737240B8B;
 Wed,  9 Dec 2020 09:33:38 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 09:33:36 +0100
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
X-Inumbo-ID: 3368b96f-7108-4f7a-b1c9-48dd7800cb85
Authentication-Results: garm.ovh; auth=pass (GARM-106R00683016755-4cd7-4a58-9314-76cd7bd62976,
                    F89B705946B58AFC48376D7414C518838B559611) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 3/3] net: checksum: Introduce fine control over checksum
 type
To: Bin Meng <bmeng.cn@gmail.com>, <qemu-devel@nongnu.org>
CC: Bin Meng <bin.meng@windriver.com>, Alistair Francis
	<alistair@alistair23.me>, Andrew Jeffery <andrew@aj.id.au>, Anthony Perard
	<anthony.perard@citrix.com>, Beniamino Galvani <b.galvani@gmail.com>, David
 Gibson <david@gibson.dropbear.id.au>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>, Jason Wang <jasowang@redhat.com>, Joel Stanley
	<joel@jms.id.au>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Paul Durrant <paul@xen.org>, Peter Chubb
	<peter.chubb@nicta.com.au>, Peter Maydell <peter.maydell@linaro.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Zhang Chen <chen.zhang@intel.com>,
	<qemu-arm@nongnu.org>, <qemu-ppc@nongnu.org>,
	<xen-devel@lists.xenproject.org>
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
 <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <adb845f8-8623-988f-cb11-148ec4cc2f4b@kaod.org>
Date: Wed, 9 Dec 2020 09:33:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 481ee65c-d874-4de9-800e-f6db287e3d47
X-Ovh-Tracer-Id: 10079618919775570899
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefudeltdfhtddtieevudduveehffeutedvueeuleduiedvgffgueduhfehgfejheenucffohhmrghinhepohhffhhlohgrugdrnhgvthdpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepsghmvghnghdrtghnsehgmhgrihhlrdgtohhm

Hello !

> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 782ff19..fbae1f1 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -573,7 +573,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
>              }
>  
>              if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
> -                net_checksum_calculate(s->frame, frame_size);
> +                /*
> +                 * TODO:
> +                 * FTGMAC100_TXDES1_IP_CHKSUM seems to be only for IP checksum,
> +                 * however previous net_checksum_calculate() did not calculate
> +                 * IP checksum at all. Passing CSUM_ALL for now until someone
> +                 * who is familar with this MAC to figure out what should be
> +                 * properly added for TCP/UDP checksum offload.
> +                 */
> +                net_checksum_calculate(s->frame, frame_size, CSUM_ALL);
>              }
>              /* Last buffer in frame.  */
>              qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);


You can test your changes using the HOWTO Joel provided here : 

  https://github.com/openbmc/qemu/wiki/Usage

Please also check the Linux driver  :

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/faraday/ftgmac100.c#n685

That said, something like the change below should be more appropriate.

Thanks,

C. 

+static int ftgmac100_convert_csum_flag(uint32_t flags)
+{
+    int csum = 0;
+
+    if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
+        csum |= CSUM_IP;
+    }
+    if (flags & FTGMAC100_TXDES1_TCP_CHKSUM) {
+        csum |= CSUM_TCP;
+    }
+    if (flags & FTGMAC100_TXDES1_UDP_CHKSUM) {
+        csum |= CSUM_UDP;
+    }
+    return csum;
+}
+
 static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
                             uint32_t tx_descriptor)
 {
@@ -602,6 +618,7 @@ static void ftgmac100_do_tx(FTGMAC100Sta
         ptr += len;
         frame_size += len;
         if (bd.des0 & FTGMAC100_TXDES0_LTS) {
+            int csum = ftgmac100_convert_csum_flag(flags);
 
             /* Check for VLAN */
             if (flags & FTGMAC100_TXDES1_INS_VLANTAG &&
@@ -610,16 +627,8 @@ static void ftgmac100_do_tx(FTGMAC100Sta
                                             FTGMAC100_TXDES1_VLANTAG_CI(flags));
             }
 
-            if (flags & FTGMAC100_TXDES1_IP_CHKSUM) {
-                /*
-                 * TODO:
-                 * FTGMAC100_TXDES1_IP_CHKSUM seems to be only for IP checksum,
-                 * however previous net_checksum_calculate() did not calculate
-                 * IP checksum at all. Passing CSUM_ALL for now until someone
-                 * who is familar with this MAC to figure out what should be
-                 * properly added for TCP/UDP checksum offload.
-                 */
-                net_checksum_calculate(s->frame, frame_size, CSUM_ALL);
+            if (csum) {
+                net_checksum_calculate(s->frame, frame_size, csum);
             }
             /* Last buffer in frame.  */
             qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);

