From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] adjust special domain creation (and
 call it earlier on x86)
Date: Fri, 31 May 2019 09:02:01 -0700
Message-ID: <f6744ab2-896d-e44d-8b1c-c6a77c456b51@citrix.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
 <a30a6fc9-5c3c-081b-d268-231e89f135be@citrix.com>
 <5CF14F650200007800234123@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWjyy-00071s-AA
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 16:02:16 +0000
In-Reply-To: <5CF14F650200007800234123@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAwODo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4KPj4+ICsjaWZkZWYgQ09O
RklHX0hBU19QQ0kKPj4+ICsgICAgSU5JVF9MSVNUX0hFQUQoJmRvbV94ZW4tPmFyY2gucGRldl9s
aXN0KTsKPj4+ICsjZW5kaWYKPj4gVGhlIHBvc2l0aW9uIG9mIHRoaXMgaWRlbnRpZmllcyB0aGF0
IHdlJ3ZlIGdvdCBvYnZpb3VzbHkgZ290IGJ1Z3MKPj4gKHBlcmhhcHMgbGF0ZW50KSBlbHNld2hl
cmUsIHNlZWluZyBhcyBvdGhlciBzcGVjaWFsIGRvbWFpbnMgZG9uJ3QgZ2V0Cj4+IHdvcmtpbmcg
Y29uc3RydWN0cyBzdWNoIGFzIGxpc3RfZW1wdHkoKS4KPj4KPj4gSW4gdGhlIGNvZGUgd2hpY2gg
Y3VycmVudGx5IGV4aXN0cywgSSBjYW4ndCBzcG90IGl0IGV2ZXIgYmVpbmcgdG91Y2hlZAo+PiBm
b3IgQVJNLCBidXQgaXQgaXMgY29uc3RydWN0ZWQgZm9yIGFsbCBub24tc3BlY2lhbCB4ODYgZ3Vl
c3RzIGF0IHRoZSB0b3AKPj4gb2YgYXJjaF9kb21haW5fY3JlYXRlKCkuCj4+Cj4+IEkgdGhpbmsg
dGhlIGJlc3Qgb3B0aW9uLCBnaXZlbiB0aGUgI2lmZGVmIGhlcmUsIGlzIHRvIHJlcG9zaXRpb24g
dGhlCj4+IHBkZXYgZmllbGRzIGludG8gc3RydWN0IGRvbWFpbiwgcmF0aGVyIHRoYW4gYXJjaF9k
b21haW4sIGFuZCBoYXZlIHRoaXMKPj4gY29kZSBmcmFnbWVudCBuZWFyIHRoZSB0b3Agb2YgZG9t
YWluX2NyZWF0ZSgpIHdoZXJlIHNwZWNpYWwgZG9tYWlucyB3aWxsCj4+IGFsbCBiZSBjb3ZlcmVk
Lgo+IEV4Y2VwdCB0aGF0IGlmIEkgZG8gdGhpcywgdGhlbiBub3QgYnkgc3BlY2lhbCBjYXNpbmcg
c3BlY2lhbCBkb21haW5zLgoKV2hhdCBzcGVjaWFsIGNhc2luZz/CoCBUaGVyZSBpcyBhIGJsb2Nr
IG9mIGNvZGUgbmVhciB0aGUgc3RhcnQgb2YKZG9tYWluX2NyZWF0ZSgpIHdoaWNoIGlzIHJ1biBm
b3IgYWxsIGRvbWFpbiwgaW5jbHVkaW5nIHNwZWNpYWwgb25lcy4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
