From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Wed, 16 Jan 2019 13:29:58 -0500
Message-ID: <63de5590-ae31-8627-9443-73fb0c8c2a8f__35195.9344036461$1547663440$gmane$org@oracle.com>
References: <20190114124413.3742-1-jgross@suse.com>
 <ebfc24e3-21a0-6cc6-ae68-5c13c1e66b9a@knorrie.org>
 <4808225b-e413-2ec1-77a1-15999c18583f@suse.com>
 <20190116131703.GB2793@localhost.localdomain>
 <efaf168e-feca-2c09-96e1-3f58be9853bf@suse.com>
 <71f7d41b-1822-d0b5-a28a-b10172bc5746@oracle.com>
 <c426f0a5-59bf-2ccb-6afd-39990a9fddac@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HFAl=PY=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gjpyF-0002zy-IJ
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 18:31:23 +0000
In-Reply-To: <c426f0a5-59bf-2ccb-6afd-39990a9fddac@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Hans van Kranenburg <hans@knorrie.org>, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gMS8xNi8xOSAxMDoyOSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNi8wMS8yMDE5
IDE2OjA3LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDEvMTYvMTkgOTozMyBBTSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToKPj4+IE9uIDE2LzAxLzIwMTkgMTQ6MTcsIEJvcmlzIE9zdHJvdnNr
eSB3cm90ZToKPj4+PiBPbiBXZWQsIEphbiAxNiwgMjAxOSBhdCAwODo1MDoxM0FNICswMTAwLCBK
dWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Cj4+Pj4+IEBAIC0xNjUwLDEzICsxNjUwLDE0IEBAIHZv
aWQgeGVuX2NhbGxiYWNrX3ZlY3Rvcih2b2lkKQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICB4ZW5faGF2ZV92ZWN0b3JfY2FsbGJhY2sgPSAwOwo+Pj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm47Cj4+Pj4+ICAgICAgICAgICAgICAgICB9Cj4+Pj4+IC0gICAgICAgICAgICAg
ICBwcl9pbmZvKCJYZW4gSFZNIGNhbGxiYWNrIHZlY3RvciBmb3IgZXZlbnQgZGVsaXZlcnkgaXMK
Pj4+Pj4gZW5hYmxlZFxuIik7Cj4+Pj4+ICsgICAgICAgICAgICAgICBpZiAoIXNpbGVudCkKPj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfaW5mbygiWGVuIEhWTSBjYWxsYmFjayB2ZWN0
b3IgZm9yIGV2ZW50Cj4+Pj4+IGRlbGl2ZXJ5IGlzIGVuYWJsZWRcbiIpOwo+Pj4+IEhvdyBhYm91
dCByZXBsYWNpbmcgcHJfaW5mbygpIHdpdGggcHJfaW5mb19vbmNlKCk/Cj4+PiBXaGF0IGEgbmlj
ZSBhbmQgc2ltcGxlIGlkZWEhCj4+Pgo+Pj4gRXh0cmEgcGF0Y2ggb3IgVjQ/Cj4+Pgo+Pgo+PiBJ
IGNhbiBhZGQgdGhpcyB3aGlsZSBjb21taXR0aW5nLCBJIGRvbid0IHRoaW5rIGl0J3Mgd29ydGgg
YSB3aG9sZSBuZXcgcGF0Y2guCj4+Cj4+IE9uZSBvdXRzdGFuZGluZyBxdWVzdGlvbiBJIGhhdmUg
aXMgd2hldGhlciBhbnl0aGluZyBuZWVkcyB0byBiZSBhZGRlZCB0bwo+PiB0aGUgY29tbWl0IG1l
c3NhZ2UgKFRob21hcyBoYWQgc29tZSBxdWVzdGlvbnMpCj4gSGUgZGlkbid0IHJlYWN0IHRvIG15
IGV4cGxhbmF0aW9uLiBJJ20gaW50ZXJwcmV0aW5nIHRoYXQgYXMgaGltIGJlaW5nCj4gZmluZSB3
aXRoIG15IGV4cGxhbmF0aW9uLCB3aGljaCBJIGJlbGlldmUgaXMgbm90IHN1aXRhYmxlIHRvIGJl
IGFkZGVkCj4gdG8gdGhlIGNvbW1pdCBtZXNzYWdlLgoKT0suIEFwcGxpZWQgdG8gKG5vdyBwcm9w
ZXJseSBuYW1lZCkgZm9yLWxpbnVzLTUuMAoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
