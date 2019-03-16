From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v2 00/14] Add support for Hygon Dhyana
 Family 18h processor
Date: Sat, 16 Mar 2019 18:40:24 +0800
Message-ID: <08b3c487-03cc-a8a0-1ae7-560b2b8cc179@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
 <5C8BAB78020000780021F503@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Sez+=RT=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1h56t4-0001Cm-Iv
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2019 10:49:58 +0000
In-Reply-To: <5C8BAB78020000780021F503@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8zLzE1IDIxOjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMS4wMi4xOSBh
dCAxMDo0OCwgPHB1d2VuQGh5Z29uLmNuPiB3cm90ZToKPj4gUHUgV2VuICgxNCk6Cj4+ICAgIHg4
Ni9jcHU6IENyZWF0ZSBIeWdvbiBEaHlhbmEgYXJjaGl0ZWN0dXJlIHN1cHBvcnQgZmlsZQo+PiAg
ICB4ODYvY3B1L210cnI6IEFkZCBIeWdvbiBEaHlhbmEgc3VwcG9ydCB0byBnZXQgVE9QX01FTTIK
Pj4gICAgeDg2L2NwdS92cG11OiBBZGQgSHlnb24gRGh5YW5hIGFuZCBBTUQgWmVuIHN1cHBvcnQg
Zm9yIHZQTVUKPj4gICAgeDg2L2NwdS9tY2U6IEFkZCBIeWdvbiBEaHlhbmEgc3VwcG9ydCB0byB0
aGUgTUNBIGluZnJhc3RydWN0dXJlCj4+ICAgIHg4Ni9zcGVjX2N0cmw6IEFkZCBIeWdvbiBEaHlh
bmEgdG8gdGhlIHJlc3BlY3RpdmUgbWl0aWdhdGlvbiBtYWNoaW5lcnkKPj4gICAgeDg2L2FwaWM6
IEFkZCBIeWdvbiBEaHlhbmEgc3VwcG9ydAo+PiAgICB4ODYvYWNwaTogQWRkIEh5Z29uIERoeWFu
YSBzdXBwb3J0Cj4+ICAgIHg4Ni9pb21tdTogQWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0Cj4+ICAg
IHg4Ni9wdjogQWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0IHRvIGVtdWxhdGUgTVNScyBhY2Nlc3MK
Pj4gICAgeDg2L2RvbWFpbjogQWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0Cj4+ICAgIHg4Ni9kb21j
dGw6IEFkZCBIeWdvbiBEaHlhbmEgc3VwcG9ydAo+PiAgICB4ODYvdHJhcHM6IEFkZCBIeWdvbiBE
aHlhbmEgc3VwcG9ydAo+PiAgICB4ODYvY3B1aWQ6IEFkZCBIeWdvbiBEaHlhbmEgc3VwcG9ydAo+
PiAgICB0b29scy9saWJ4YzogQWRkIEh5Z29uIERoeWFuYSBzdXBwb3J0Cj4gCj4gSW4gYWRkaXRp
b24gdG8gdGhlc2UgY2hhbmdlcywgd2hhdCBhYm91dCBwY2lfY2ZnX29rKCk/IEkgZG9uJ3QgdGhp
bmsKPiBJJ3ZlIHNlZW4gYW55IG9mIHRoZSBwYXRjaGVzIHRvdWNoIGl0LgoKQmVjYXVzZSBIeWdv
biBkb2VzIG5vdCBhY2Nlc3MgdGhlIGV4dGVuZGVkIE5CIGNvbmZpZ3VyYXRpb24gc3BhY2Ugcmln
aHQKbm93LCBzbyB0aGVyZSBpcyBubyBjaGFuZ2UgdG8gcGNpX2NmZ19vaygpLgoKLS0gClJlZ2Fy
ZHMsClB1IFdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
