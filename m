From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [OSSTEST PATCH 5/6] Debian: preferred arch: Apply
 setarch to sshd
Date: Thu, 25 Apr 2019 19:52:58 +0100
Message-ID: <4d0ff4ea-078e-9f49-8824-fc03a705be06@citrix.com>
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
 <20190425155056.23145-6-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJjUh-0002I3-0x
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:53:15 +0000
In-Reply-To: <20190425155056.23145-6-ian.jackson@eu.citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDQvMjAxOSAxNjo1MCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gTWFueSBidWlsZCBzeXN0
ZW1zIChpbmNsdWRpbmcgWGVuJ3MsIGFuZCBhdXRvY29uZikgdXNlIHVuYW1lIHRvIHRyeSB0bwo+
IGRpc2Nlcm4gdGhlIHN5c3RlbSdzIGFyY2hpdGVjdHVyZS4gIFdoZW4gcnVubmluZyBpMzg2IHVz
ZXJsYW5kIG9uIGFuCj4gYW1kNjQga2VybmVsLCB0aGlzIGdpdmVzIHRoZSB3cm9uZyBhbnN3ZXIu
ICBUaGVzZSBidWlsZCBzeXN0ZW1zIHRoZW4KPiBnbyBvZmYgYW5kIHRyeSB0byBkbyBhIHNvcnQg
b2YgY3Jvc3MgY29tcGlsZSB0aGluZywgYW5kLCBnZW5lcmFsbHksCj4gZmFsbCBvdmVyLgo+Cj4g
VGhlIHVuYW1lIC1tIHZhbHVlICh3aGljaCBpcyB3aGF0IGlzIGF0IGlzc3VlKSBpcyBhbiBpbmhl
cml0ZWQgcHJvY2Vzcwo+IHByb3BlcnR5LiAgTGludXggcHJvdmlkZXMgYSB1dGlsaXR5IGBzZXRh
cmNoJyB3aGljaCBjaGFuZ2VzIHRoaXMuICBXZQo+IG5lZWQgdG8gYXBwbHkgdGhpcyB0byBhbGwg
YnVpbGRzOyBhbmQgaXQgaXMgbm90IHJlYWxseSBjb252ZW5pZW50IHRvCj4gYWRkIGFuIGFkdmVy
YmlhbCBjb21tYW5kIHRvIGV2ZXJ5IGJ1aWxkIHZpYSB0aGUgZXhpc3Rpbmcgc3NoIGJ1aWxkCj4g
c2hlbGwgcnVuZSBtZWNoYW5pc21zLgo+Cj4gQSBmYWlybHkgc2ltcGxlIHdheSB0byBnZXQgdGhl
IHJpZ2h0IGJlaGF2aW91ciBpcyB0byB3cmFwIHNzaGQKPiBpbnN0ZWFkLiAgc3NoZCBkb2Vzbid0
IG1pbmQgd2hhdCBgcGVyc29uYWxpdHknIGl0IHNlZXMuICBSZXBsYWNpbmcKPiAvdXNyL2Jpbi9z
c2hkIHdpdGggYSB3cmFwcGVyIHNoZWxsIHNjcmlwdCBtaWdodCBicmVhawo+IHN0YXJ0LXN0b3At
ZGFlbW9uJ3MgYXR0ZW1wdHMgdG8gc2h1dCBkb3duIG9yIHJlc3RhcnQgc3NoZCBidXQgd2UgZG9u
J3QKPiBjYXJlIGFib3V0IHRoYXQgaW4gb3NzdGVzdCAoY2VydGFpbmx5IG5vdCBvbiBidWlsZCBp
bnN0YWxscywgd2hlcmUKPiB0aGlzIGZlYXR1cmUgaXMgdG8gYmUgdXNlZCkuCgpXaGF0IGlzIHdy
b25nIHdpdGggc2V0dGluZyBYRU5fVEFSR0VUX0FSQ0g9eDg2X3s2NCwzMn0gPwoKVGhpcyBpcyBo
b3cgYWxsIHRoZSB0cmF2aXMgQ0kgam9icyB3b3JrIGZvciBtaXhlZCBrZXJuZWwvdXNlcnNwYWNl
LCBhbmQsCmFzIEkgbm90ZSwgaG93IHRoZSBkZWJpYW4gcGFja2FnZXMgZG8gdGhpcyBhcyB3ZWxs
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
