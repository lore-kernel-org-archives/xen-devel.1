Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EB0FD3760
	for <xen-devel@archiver.kernel.org>; Wed, 25 Feb 2026 14:15:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1240787.1542056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvFfd-0008L2-Tf; Wed, 25 Feb 2026 14:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240787.1542056; Wed, 25 Feb 2026 14:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvFfd-0008Kv-Pz; Wed, 25 Feb 2026 14:15:21 +0000
Received: by outflank-mailman (input) for mailman id 1240787;
 Wed, 25 Feb 2026 14:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g5s2=A5=bounce.vates.tech=bounce-md_30504962.699f03f1.v1-bb8b06444c3d4478bbb10018a210ef0e@srs-se1.protection.inumbo.net>)
 id 1vvFfc-0008Kp-OQ
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 14:15:20 +0000
Received: from mail186-12.suw21.mandrillapp.com
 (mail186-12.suw21.mandrillapp.com [198.2.186.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 672a1816-1254-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 15:15:15 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-12.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4fLc754YW4z705b0c
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 14:15:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bb8b06444c3d4478bbb10018a210ef0e; Wed, 25 Feb 2026 14:15:13 +0000
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
X-Inumbo-ID: 672a1816-1254-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772028913; x=1772298913;
	bh=JGWN5jkvYY71URPpUEe8IqNYzfuwlhJJo5SoK8DxtuE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mrQYZ+wLz3+s8KQfcz1wlvRqwPY2981AKwC5KfmyCxtxLLBEWuSKhx9f08TbbkDq1
	 NfCSFzyiuwObIT3eL2UWvi8przDLX3Mx5rWiy8Vm9IvxmVXwW9AXdeQVbITL7HxC3+
	 y2kFoO7OS9kGPJ0iaTgNigdjwvvMyUOcReCLts+Gkfo1yls+lGxrCDjYlnvL/YUTai
	 QWx1fu5KWOeqW7PueZgH+AYVj4WAQUMhQgH3JO8tI8qYLRtgr+iiLoCcAOxhiiyUSZ
	 cSNF5PZdvcOrDYyKbsS8Em3H3k1bAJrHEDVbT0v5ObehW43sBC2AuSHEAvI2Mv2Bm1
	 8tJXBz6pyh92g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772028913; x=1772289413; i=anthony.perard@vates.tech;
	bh=JGWN5jkvYY71URPpUEe8IqNYzfuwlhJJo5SoK8DxtuE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AcQKiMCxQUIAeBH7dfLDpDZq/kNVQUxxH+imVfuCGpYYGYnOA0XEj6Y/0gE8frYsC
	 JraFLRnt5w8o+slNa6aqblHfTyK8m4DQWFTemrAnLSgTPLPojmiw/ZKzgrynbRo2De
	 5mys8E34LNI8ee3Lrj0FWf0pyfJqKg/DE2j4Df4T96XUmstTOBCGkbdIpCfEb8fjhG
	 Esbnxy0zrFDpZUO7CmLWwdf5xlWKU695JzuDxkwjoKbFBgT6JemD2PsCVhcTZ1N9FK
	 HZerd7EA+dDIetd8cS52ITLEWdbIVF0AJfJnOhkp4sPytYG/oh0AqWmAYJApDUxZH8
	 whUbyP6XOadAw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=205/5]=20accel/xen:=20Build=20without=20target-specific=20knowledge?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772028911983
To: "=?utf-8?Q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, "Pierrick Bouvier" <pierrick.bouvier@linaro.org>, "Paolo Bonzini" <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, "Stefano Stabellini" <sstabellini@kernel.org>, "Anthony PERARD" <anthony@xenproject.org>, "Paul Durrant" <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-Id: <aZ8D77iyFtqyGF18@l14>
References: <20260225051303.91614-1-philmd@linaro.org> <20260225051303.91614-6-philmd@linaro.org>
In-Reply-To: <20260225051303.91614-6-philmd@linaro.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bb8b06444c3d4478bbb10018a210ef0e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260225:md
Date: Wed, 25 Feb 2026 14:15:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 06:13:03AM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Code in accel/ aims to be target-agnostic. Enforce that
> by moving the MSHV file units to system_ss[], which is

You mean Xen    ^ here ?

> target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

In anycase, it seems to works fine for me:
Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



