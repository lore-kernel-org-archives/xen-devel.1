From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v9 06/11] x86/entry: Organise the use of
 MSR_SPEC_CTRL at each entry/exit point
Date: Mon, 22 Jan 2018 17:27:28 -0500
Message-ID: <0b7e80cd-c635-8fcf-7bc8-96946abe78e1@oracle.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-7-git-send-email-andrew.cooper3@citrix.com>
 <5A61E7E702000078001A0553@prv-mh.provo.novell.com>
 <1fe16c0c-7c91-f43f-c3b6-47e82dcd2909@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1fe16c0c-7c91-f43f-c3b6-47e82dcd2909@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTkvMjAxOCAwODozNiBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wMS8x
OCAxMTo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4KPj4+IEBAIC05OSw2ICsxMDYsMTAgQEAgVU5M
SUtFTFlfRU5EKHJlYWxtb2RlKQo+Pj4gIC5Mdm14X3ZtZW50cnlfZmFpbDoKPj4+ICAgICAgICAg
IHN0aQo+Pj4gICAgICAgICAgU0FWRV9BTEwKPj4+ICsKPj4+ICsgICAgICAgIFNQRUNfQ1RSTF9F
TlRSWV9GUk9NX1BWIC8qIFJlcTogJXJzcD1yZWdzL2NwdWluZm8gQ2xvYjogYWNkICovCj4+IEkg
dGhpbmsgdGhlIHVzZSBvZiB0aGUgUFYgdmFyaWFudCBoZXJlIHJlcXVpcmVzIGEgY29tbWVudC4K
PiBPaC4gIEl0IHVzZWQgdG8gaGF2ZSBvbmUuLi4gIEknbGwgdHJ5IHRvIGZpbmQgaXQuCgpJLCBp
biBmYWN0LCBtZWFudCB0byBhc2sgYWJvdXQgdGhpcyBmb3IgYSBsb25nIHRpbWUgYW5kIGFsd2F5
cyBmb3Jnb3QuClBlcmhhcHMgeW91ciBjb21tZW50IHdpbGwgc2F5IG1vcmUgdGhhbiBqdXN0IHdo
eSBhIFBWIHZhcmlhbnQgaXMgdXNlZApoZXJlIGJ1dCBpbiBjYXNlIGl0IHdvbid0IC0tLSB3aHkg
ZG8gd2UgaGF2ZSAqYW55KiBtaXRpZ2F0aW9uIGhlcmU/IFdlCmFyZSBuZXZlciByZXR1cm5pbmcg
dG8gdGhlIGd1ZXN0LCBkbyB3ZT8KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
