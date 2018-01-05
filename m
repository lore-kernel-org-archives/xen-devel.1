From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC v1 33/74] x86/guest: enable event
 channels upcalls
Date: Fri, 5 Jan 2018 15:19:24 +0000
Message-ID: <4858df55-fee0-00c9-2c8a-0bfffe5cbd0a@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-34-wei.liu2@citrix.com>
 <5A4FA2B7020000780019B712@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oku2=ea=citrix.com=prvs=536ec9109=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eXTmQ-00086g-4U
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 15:19:34 +0000
In-Reply-To: <5A4FA2B7020000780019B712@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDEvMTggMTU6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0LjAxLjE4IGF0
IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC0zMCw2ICszMSw3IEBA
Cj4+ICBib29sIHhlbl9ndWVzdDsKPj4gIAo+PiAgc3RhdGljIHVpbnQzMl90IHhlbl9jcHVpZF9i
YXNlOwo+PiArc3RhdGljIHVpbnQ4X3QgZXZ0Y2huX3VwY2FsbF92ZWN0b3I7Cj4gVGhlcmUgYmVp
bmcgYSBzaW5nbGUgZ2xvYmFsIHZlY3Rvciwgd2h5IGRvIHlvdSB1c2UKPiBIVk1PUF9zZXRfZXZ0
Y2huX3VwY2FsbF92ZWN0b3IgaW5zdGVhZCBvZiBzZXR0aW5nCj4gSFZNX1BBUkFNX0NBTExCQUNL
X0lSUT8KCkJlY2F1c2UgYW5vdGhlciBkaXNjb3ZlcnkgaXMgdGhhdCBIVk1fUEFSQU1fQ0FMTEJB
Q0tfSVJRIGlzIHN1YnRseQpicm9rZW4uwqAgSXQgaXMgaW5jb21wYXRpYmxlIHdpdGggTDAgWGVu
IGNob29zaW5nIHRvIHVzZSBoYXJkd2FyZSBBUElDCmFzc2lzdGFuY2UsIGR1ZSB0byBpdHMgZGVs
aWJlcmF0ZSAoYWIpdXNlIG9mIHRoZSBJUlIgc3RhdGUgbW9kZWwuCgpPVE9ILCB0aGVyZSBhcmUg
cGF0Y2hlcyAocGVyaGFwcyBsYXRlciwgcGVyaGFwcyBub3QgcG9zdGVkIHlldCkgd2hpY2ggZG8K
dHJ5IHRvIG1ha2UgdXNlIG9mIENBTExCQUNLX0lSUSBmb3IgY29tcGF0aWJpbGl0eSBvbiBvbGRl
ciBMMCBoeXBlcnZpc29ycy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
