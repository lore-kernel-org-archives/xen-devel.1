From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] drivers/video: use vlfb_info
 consistently
Date: Mon, 6 May 2019 16:33:39 +0100
Message-ID: <5c501a7c-ffc5-71ed-5b33-fa6b3724bbbd@citrix.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <0463b8875424fc7be3d8ec5610d21439507af325.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Pjh=TG=citrix.com=prvs=022dda640=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hNfcl-0008UX-Dn
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:33:51 +0000
In-Reply-To: <0463b8875424fc7be3d8ec5610d21439507af325.1557154206.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOSAxNTo1MCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IHZsZmJfaW5mbyBpcyBhbiBhbGlhcyBmb3IgdmdhX2NvbnNvbGVfaW5mby51LnZlc2FfbGZiLCBz
byB0aGlzIGNoYW5nZSBpcwo+IHB1cmVseSBjb3NtZXRpYy4gQnV0IHVzaW5nIHRoZSBzYW1lIG5h
bWUgaGVscHMgcmVhZGluZyB0aGUgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KCkFja2Vk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
