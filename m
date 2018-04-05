From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] python: xc: fix max_cpu_index sign error
Date: Thu, 5 Apr 2018 19:19:18 +0200
Message-ID: <30b9e28c-9ff3-96a1-d733-0343d1be81cb@suse.com>
References: <1522932563-89973-1-git-send-email-epetre@amazon.com>
 <20180405125403.yuapvd6hv3xh7tdv@citrix.com> <20180405164525.GH3176@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=n+lr=g2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f48Xk-0007ra-0v
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 17:19:24 +0000
In-Reply-To: <20180405164525.GH3176@mail-itl>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Petre Eftime <epetre@amazon.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDQvMTggMTg6NDUsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPiBP
biBUaHUsIEFwciAwNSwgMjAxOCBhdCAwMTo1NDowM1BNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+
PiBDQyBNYXJlawo+Pgo+PiBPbiBUaHUsIEFwciAwNSwgMjAxOCBhdCAxMjo0OToyM1BNICswMDAw
LCBQZXRyZSBFZnRpbWUgd3JvdGU6Cj4+PiBXaGVuIDAtaW5kZXhpbmcsIG1heGltdW0gaW5kZXgg
aXMgbnVtX2VudHJpZXMgLSAxLiBUaGUgcHl0aG9uIHhjIGxpYnJhcnkgaGFkIGEKPj4+IHNpZ24g
ZXJyb3Igd2hlcmUgdGhlIG1pbnVzIHdhcyByZXBsYWNlZCBieSBhIHBsdXMsIG1ha2luZyB0b29s
cyB0aGF0IGRlcGVuZGVkCj4+PiBvbiBpdCB0byBsb29rIGZvciBDUFVzIHRoYXQgZGlkIG5vdCBl
eGlzdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRyZSBFZnRpbWUgPGVwZXRyZUBhbWF6b24u
Y29tPgo+IAo+IEFja2VkLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVr
QGludmlzaWJsZXRoaW5nc2xhYi5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
