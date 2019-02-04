From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 10/15] argo: implement the notify op
Date: Mon, 04 Feb 2019 08:11:56 -0700
Message-ID: <5C58563C0200007800213B38@prv1-mh.provo.novell.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-11-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gqfuo-0002Sk-Ov
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 15:12:06 +0000
In-Reply-To: <1548908900-1128-11-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDA1OjI4LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEBAIC0xODAyLDYgKzIxNTcsMjEgQEAgZG9fYXJnb19vcCh1bnNpZ25lZCBpbnQg
Y21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzEsCj4gICAgICAgICAgYnJlYWs7
Cj4gICAgICB9Cj4gIAo+ICsgICAgY2FzZSBYRU5fQVJHT19PUF9ub3RpZnk6Cj4gKyAgICB7Cj4g
KyAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fYXJnb19yaW5nX2RhdGFfdCkgcmlu
Z19kYXRhX2huZCA9Cj4gKyAgICAgICAgICAgICAgICAgICBndWVzdF9oYW5kbGVfY2FzdChhcmcx
LCB4ZW5fYXJnb19yaW5nX2RhdGFfdCk7Cj4gKwo+ICsgICAgICAgIGlmICggdW5saWtlbHkoKCFn
dWVzdF9oYW5kbGVfaXNfbnVsbChhcmcyKSkgfHwgYXJnMyB8fCBhcmc0KSApCj4gKyAgICAgICAg
ewo+ICsgICAgICAgICAgICByYyA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsg
ICAgICAgIH0KPiArCj4gKyAgICAgICAgcmMgPSBub3RpZnkoY3VycmQsIHJpbmdfZGF0YV9obmQp
Owo+ICsgICAgICAgIGJyZWFrOwo+ICsgICAgfQo+ICsKPiAgICAgIGRlZmF1bHQ6Cj4gICAgICAg
ICAgcmMgPSAtRU9QTk9UU1VQUDsKPiAgICAgICAgICBicmVhazsKPiBAQCAtMTkxMiw2ICsyMjgy
LDIxIEBAIGNvbXBhdF9hcmdvX29wKHVuc2lnbmVkIGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVf
UEFSQU0odm9pZCkgYXJnMSwKPiAgICAgICAgICBicmVhazsKPiAgICAgIH0KPiAgCj4gKyAgICBj
YXNlIFhFTl9BUkdPX09QX25vdGlmeToKPiArICAgIHsKPiArICAgICAgICBYRU5fR1VFU1RfSEFO
RExFX1BBUkFNKHhlbl9hcmdvX3JpbmdfZGF0YV90KSByaW5nX2RhdGFfaG5kID0KPiArICAgICAg
ICAgICAgICAgICAgIGd1ZXN0X2hhbmRsZV9jYXN0KGFyZzEsIHhlbl9hcmdvX3JpbmdfZGF0YV90
KTsKPiArCj4gKyAgICAgICAgaWYgKCB1bmxpa2VseSgoIWd1ZXN0X2hhbmRsZV9pc19udWxsKGFy
ZzIpKSB8fCBhcmczIHx8IGFyZzQpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHJjID0g
LUVJTlZBTDsKPiArICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAg
ICByYyA9IG5vdGlmeShjdXJyZCwgcmluZ19kYXRhX2huZCk7Cj4gKyAgICAgICAgYnJlYWs7Cj4g
KyAgICB9CgpBdCB0aGUgZXhhbXBsZSBvZiB0aGlzIChsaWtlbHkgYXBwbGllcyB0byBlYXJsaWVy
IHBhdGNoZXMgYXMgbXVjaCk6IEFyZW4ndAp5b3UgYWZyYWlkIG9mIHRoaXMgcmVjdXJyaW5nIGR1
cGxpY2F0aW9uPyBJdCdzIHF1aXRlIGVhc3ksIGVzcGVjaWFsbHkgd2hlbgp0aGUgZnVuY3Rpb25z
IGhlcmUgZ3JvdyBhIGxpdHRsZSBmdXJ0aGVyLCBmb3Igc29tZW9uZSB0byBmb3JnZXQgdXBkYXRp
bmcKb25lIChtb3JlIGxpa2VseSB0aGUgY29tcGF0IG9uZSBvYnZpb3VzbHkpLiBEaWQgeW91IGNv
bnNpZGVyIGZvcndhcmRpbmcKYWxsIG9wZXJhdGlvbnMgbm90IG5lZWRpbmcgdHJhbnNsYXRpb24g
c3RyYWlnaHQgaW50byBkb19hcmdvX29wKCksIGFuZApoYW5kbGluZyBvbmx5IHRoZSBzZW5kdiBv
bmUgaGVyZT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
