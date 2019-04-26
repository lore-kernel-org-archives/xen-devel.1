From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mtrr: recalculate P2M type for domains
 with iocaps
Date: Fri, 26 Apr 2019 01:09:48 -0600
Message-ID: <5CC2AEBC0200007800229534@prv1-mh.provo.novell.com>
References: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
 <5CC1B6930200007800229160@prv1-mh.provo.novell.com>
 <3def1b27-f676-0fdf-1895-f44066466af9@citrix.com>
 <5CC1D6EE0200007800229263@prv1-mh.provo.novell.com>
 <63e9d382-89af-e598-9923-e8e04278651a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJuzb-00016S-OD
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 07:09:55 +0000
In-Reply-To: <63e9d382-89af-e598-9923-e8e04278651a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA0LjE5IGF0IDE4OjIyLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQWx0aG91Z2ggdGhlcmUgYXJlIHRoaW5ncyB0aGF0IEknbSBub3Qgc3VyZSBhYm91dDoK
PiAtIHdoZXRoZXIgaW9jYXBzIGFyZSBhbHdheXMgdXNlZCBieSBzb2Z0d2FyZSBpbiBEb20wIHdo
ZW4gcGFzc2luZwo+IHRocm91Z2ggY2VydGFpbiBwaHlzaWNhbCBtZW1vcnkgYW5kIHdoZXRoZXIg
dGhlaXIgdXNhZ2UgaXMgZW5mb3JjZWQgYnkgWGVuCgpJJ20gYWZyYWlkIEknbSBzdHJ1Z2dsaW5n
IHRvIHVuZGVyc3RhbmQgd2hhdCBleGFjdGx5IHlvdSBtZWFuLgpQYXNzaW5nIHRocm91Z2ggYSBk
ZXZpY2Ugd2l0aG91dCBhbHNvIHJlZ2lzdGVyaW5nIHRoZSBCQVJzCmZvciB1c2UgYnkgdGhlIHRh
cmdldCBndWVzdCBzaW1wbHkgd291bGRuJ3QgeWllbGQgYSBmdW5jdGlvbmluZwpkZXZpY2UgKGlu
IHRoZSBndWVzdCkuIEFyZ3VhYmx5IGl0IHNob3VsZG4ndCBiZSBhIHNlcGFyYXRlCmRvbWN0bCwg
YnV0IHRoYXQncyBob3cgdGhlIHBlb3BsZSBvcmlnaW5hbGx5IGltcGxlbWVudGluZwpwYXNzLXRo
cm91Z2ggY2hvc2UgdG8gc3RydWN0dXJlIHRoaW5ncy4gSXQgaGFzIHRoZSBhZHZhbnRhZ2UKb2Yg
ZGV2aWNlcyB3b3JraW5nIHdoZXJlIERvbTAga25vd3MgYWJvdXQgZXh0cmEgcmVzb3VyY2VzCihN
TUlPIG9yIEkvTyBwb3J0cykgd2hlbiBYZW4gZG9lc24ndC4gSXQgaGFzIHRoZQpkaXNhZHZhbnRh
Z2Ugb2YgYmVpbmcgZGVwZW5kZW50IG9uIFhlbiwgRG9tMCBrZXJuZWwsIGFuZAp0aGUgdG9vbCBz
dGFjayBpbnRlcmFjdGluZyBjb3JyZWN0bHkgKHJhdGhlciB0aGFuIGFsbCBsb2dpYyBiZWluZwpp
biBhIHNpbmdsZSBjb21wb25lbnQpLgoKVGhlcmUgd2FzIGEgc2ltaWxhcmx5IG9kZCBhcnJhbmdl
bWVudCBpbiB0aGUgb3JpZ2luYWwKaW1wbGVtZW50YXRpb24gb2YgTVNJLVgsIHdoZXJlIFhlbiBk
ZXBlbmRlZCB1cG9uIERvbTAKcmVwb3J0aW5nIHRoZSBNU0ktWCB0YWJsZSBiYXNlLiBOb3dhZGF5
cyB3ZSByZWFkIHRoZSBCQVIKb3Vyc2VsdmVzIGFuZCBzaW1wbHkgY2hlY2sgdGhhdCB0aGUgdmFs
dWUgbWF0Y2hlcyB3aGF0CkRvbTAgaGFzIHBhc3NlZC4KCj4gLSB0aGVyZSBhcmUgY291bGQgYmUg
YXNzdW1wdGlvbnMgZWxzZXdoZXJlIHRoYXQgd2l0aCBJT01NVSBjb250ZXh0Cj4gYXNzaWduZWQg
Z3Vlc3QgY2FjaGluZyBjaG9pY2UgaXMgaW4gZWZmZWN0IC0gc2luY2UgdGhhdCBmYWN0IGhhcyBi
ZWVuCj4gcGVycGV0dWF0ZWQgaW4gWGVuIGNvZGUgZm9yIHZlcnkgbG9uZyB0aW1lCgpBZ3JlZWQg
LSB0aGVyZSdzIGEgY2VydGFpbiBjaGFuY2UgdGhhdCBvdGhlciBwbGFjZXMgaW4gWGVuIGhhdmUK
c2ltaWxhciBsb2dpYy4gQnV0IHRoZXJlJ3MgYW4gZXF1YWwgY2hhbmNlIHRoYXQgb3RoZXIgcGxh
Y2VzIGluClhlbiBzaW1pbGFybHkgY2hlY2sgb25seSBvbmUgb2YgdGhlIHR3bywgd2hlbiwgaW4g
dGhlIHNwaXJpdCBvZiB5b3VyCnBhdGNoLCB0aGV5IHJlYWxseSBtZWFuIHRvIGNoZWNrIGJvdGgu
IFRoaXMgY291bGQgb25seSBiZSBjbGFyaWZpZWQKYnkgZG9pbmcgYSBmdWxsIGF1ZGl0LgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
