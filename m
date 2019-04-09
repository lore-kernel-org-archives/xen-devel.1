Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C28C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:19:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A705920830
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A705920830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDraN-00039q-PX; Tue, 09 Apr 2019 14:18:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDraN-00039l-A0
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 14:18:51 +0000
X-Inumbo-ID: 63870b9c-5ad2-11e9-b44c-6b82dc9f5bc0
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63870b9c-5ad2-11e9-b44c-6b82dc9f5bc0;
 Tue, 09 Apr 2019 14:18:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83114230"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 9 Apr 2019 15:18:37 +0100
Message-ID: <20190409141837.7187-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH] production-config: Update HTTPS proxy
 certificate
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409141837.5AQQfmajPDl3iFMnTxnMx0Rp20vDJksWm29-oF17-Lo@z>

VGhlIHByZXZpb3VzIGNlcnRpZmljYXRlIGhhZCBleHBpcmVkLCBhIG5ldyBvbmUgaGF2ZSBiZWVu
IGdlbmVyYXRlZC4KClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFy
ZEBjaXRyaXguY29tPgotLS0KIHByb2R1Y3Rpb24tY29uZmlnIHwgMzAgKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcHJvZHVjdGlvbi1jb25maWcgYi9wcm9kdWN0aW9uLWNv
bmZpZwppbmRleCA1OWM3NGNjLi43ZGE3ODIyIDEwMDY0NAotLS0gYS9wcm9kdWN0aW9uLWNvbmZp
ZworKysgYi9wcm9kdWN0aW9uLWNvbmZpZwpAQCAtMTQyLDI1ICsxNDIsMjUgQEAgQXV0aG9yaXpl
ZEtleXNGaWxlcyAvcm9vdC9vc3N0ZXN0LWF1dGhvcml6ZWRfa2V5cwogCiBIdHRwc1Byb3h5TUlU
TUNlcnQ9IDw8J0VORCcKIC0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQotTUlJRHR6Q0NBcCtn
QXdJQkFnSUpBS1lPZkRzVFpBS0FNQTBHQ1NxR1NJYjNEUUVCQ3dVQU1ISXhDekFKQmdOVgorTUlJ
RHVqQ0NBcUtnQXdJQkFnSUpBTm44cnd2VEZlaGFNQTBHQ1NxR1NJYjNEUUVCQ3dVQU1ISXhDekFK
QmdOVgogQkFZVEFsVlRNUXN3Q1FZRFZRUUlEQUpOUVRFVE1CRUdBMVVFQ2d3S2VHVnVjSEp2YW1W
amRERVpNQmNHQTFVRQogQ3d3UWVHVnVjSEp2YW1WamRGOXpjWFZwWkRFbU1DUUdBMVVFQXd3ZFky
RmphR1V1ZEdWemRDMXNZV0l1ZUdWdQotY0hKdmFtVmpkQzV2Y21jd0hoY05NVGN3TXpBNU1USTBO
VEkzV2hjTk1Ua3dNekE1TVRJME5USTNXakJ5TVFzdworY0hKdmFtVmpkQzV2Y21jd0hoY05NVGt3
TXpFeU1UTXhNREExV2hjTk1qRXdNekV4TVRNeE1EQTFXakJ5TVFzdwogQ1FZRFZRUUdFd0pWVXpF
TE1Ba0dBMVVFQ0F3Q1RVRXhFekFSQmdOVkJBb01DbmhsYm5CeWIycGxZM1F4R1RBWAogQmdOVkJB
c01FSGhsYm5CeWIycGxZM1JmYzNGMWFXUXhKakFrQmdOVkJBTU1IV05oWTJobExuUmxjM1F0YkdG
aQogTG5obGJuQnliMnBsWTNRdWIzSm5NSUlCSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1J
SUJDZ0tDQVFFQQotOVdvWlRvL2YwYkxZeitCQVdHVnQ1ZjFXeWNqMDVNaWwzRFU4NzVTcWw4MGdp
cVUyYjgwcnp3QjYwUHVmLzBTcAotNWt4OHR3WThRdlIrSnRoTFM0bWZTZGREcStXK1p3TWJyRXBw
NUU4TGUrbWRydzRZRGtkdTlieDQ3TnJXT0txRgotejdRK1dPTkNxNzVZQVdhYTBiMUpwNmZxUWlj
aE5ia0NkWlkzaHZlbUI3WkkrQ0ZXdWlyT2h6Y3FyWmxTODhxdQotaUY5VzBPaiswTzMxWlRoTlZh
SU5VcWZyWU8zeEliT3dKbDZxRWNwL2NBR3ZGcjd1eDNLaUFnL1RjNjl4Um4rVQotSGVoNGticU9s
a0U4VzV3biswd2llaTBzRWJnaTl6eFBWbnUxWFFZMUxCaDl6aDdnYkZ0N1g5WktrYTdZbE00SAot
K0l6UkhjWmwzM2tZMmFWQ05GNGM2UUlEQVFBQm8xQXdUakFkQmdOVkhRNEVGZ1FVcGtvVDNCVlox
NG9LdTZxZQotVHQ2YU12WjNzS0V3SHdZRFZSMGpCQmd3Rm9BVXBrb1QzQlZaMTRvS3U2cWVUdDZh
TXZaM3NLRXdEQVlEVlIwVAotQkFVd0F3RUIvekFOQmdrcWhraUc5dzBCQVFzRkFBT0NBUUVBZ0tZ
Y2ZIOHlrWGduWEpWU3YxVTdjYXJ4Vi9PLwotSW83NmpyWGkzTnRxWFN1Z2FkemFrRkVPZ2prTkFm
ZU9ydG1RUkFGNkp1RmhQZmh3ZVd2bmZZR1hWL1FyeEY3TgotbmtDVmh2TlRzeU5NMldEZXVCdHpq
L0NCb3lrMGpCa3d4ZGNHM1NMRXgvc0hLUGtUUHppRnVYY1B2SVRkYVAyYQotREMrTmdJZEwzRm1F
ZnphYWJiRGRyZ0dSdCsvdmZ2dTg3N2F0dnJYMS9CNS9OT0wrN21YYVRSNmp6dUpSUWVYSwotZnRu
UytaVy9HbGJ0dGZvdlBnRk4vRmpVaW9lbmZTOUlTMUlCd0NKNGQ5dUhEYmdPZ0w2dWhFUTBJcThP
dTY4ZgotTDZxT1c0cUJKbGRxeGw5VlgyUnFjSkV4UDBZd3J2cW1kc2RDK3hzVG1Ybk90cFVrQVlL
TnJ2aDdkZz09Cit3emgrQ3p4anRGcGREMXJlbDkxbjBiVTZDWisxRkFiMkxYVyt4aWJuSHZjVFpN
NmM3RDlabENXK0QrNTB6ekI5CitPOXlOWWpQbXRaQkJPaGE3Rks2NGR1NVJ6L1pta21qbWZVSGJG
K2NtaTJ1SW5lRm5MWDhQYm9HaFQ3Y3FrWWttCithTURIVHppMS9nMGpGOURSWTRnTkZXdE1kWkRz
WXgwUDRBSUd3SFVsZTl0OGkrTHU4bXhzM3RCVzc3OG4yclEvCisza0ZBV2cxZmdnZUI0WUdlMVdC
U2oxNEE1QmxDY0w0ZUVaVy9RU1NleElrc0RJcER3Wmx4RlFNcjVCQU5HQmg3CitJUmN2SmxFQlpI
djhGdnJtTXlUQUJlMTVSS3crMm9Kb0NNc2xxUFpVUUh1YkVITjRsZTd3bzRHTWJ3R1dDQkVPCitL
UUtJRS9sMXZ1MVlralJOTzdqNER3SURBUUFCbzFNd1VUQWRCZ05WSFE0RUZnUVV5dldxaFJjQ3Yx
cThVbmR0CitDdXdpLzRNbCtRWXdId1lEVlIwakJCZ3dGb0FVeXZXcWhSY0N2MXE4VW5kdEN1d2kv
NE1sK1FZd0R3WURWUjBUCitBUUgvQkFVd0F3RUIvekFOQmdrcWhraUc5dzBCQVFzRkFBT0NBUUVB
ZWphemppdUpCQm14T2pJcXh6NWZIWm1GCitpVnRpU1dhOXhhS3dyYlBMNDFFNFRwYVNUdHFUdFRG
TzZJaXpDVmdYdGRsMWNQcGs2Uy95VmYrQlcwcWtQNXZxCitzTmNOSUg1OVc0YjlaU2FRMUpRRm83
Qkl3RC9mMCtuTkJ2Ky9sOStNNkRSQk9YZzRJelZBZkxwNWZrUEpsWWszCitZd2Y1eXMwbllnNE15
cEhkNkdZTHBwVGphTEV1T1h0Wk5RRjN3Z1FPaVVDc1FxT1NYcHFacndON1JlcXZuci9XCitJQ3Yw
a1JLZnFUSHhRR251RWFtaTltSmtLSW51dXNQc0tnb1VUaDZrNXAyb1RXVkdnKzA0U2ttUmNRcHg5
SkxpCitLUXVJUWdhNUNaajZCNFd3SUw5TXk4UU4vZTArWWVKbVY5Tk5CVmd2Ti9BcUVmTlFhZURO
MDdTUFlKMUVaUT09CiAtLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCiBFTkQKLS0gCkFudGhvbnkg
UEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
