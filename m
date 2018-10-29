From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH RESEND qemu-xen-traditional] xen/pt: allow
 QEMU to request MSI unmasking at bind time
Date: Mon, 29 Oct 2018 16:58:15 +0200
Message-ID: <20181029145815.GB31019@reaktio.net>
References: <20181010185254.110354-1-andraprs@amazon.com>
 <23504.36291.25070.921458@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5r/f=nj=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1gH8zj-0008AJ-Cr
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 14:58:19 +0000
Content-Disposition: inline
In-Reply-To: <23504.36291.25070.921458@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: sstabellini@kernel.org, Andra Paraschiv <andraprs@amazon.com>, andrew.cooper3@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org, dwmw@amazon.co.uk, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiBXZWQsIE9jdCAyNCwgMjAxOCBhdCAwNDoyMDozNVBNICswMTAwLCBJYW4gSmFja3Nv
biB3cm90ZToKPiBBbmRyYSBQYXJhc2NoaXYgd3JpdGVzICgiW1BBVENIIFJFU0VORCBxZW11LXhl
bi10cmFkaXRpb25hbF0geGVuL3B0OiBhbGxvdyBRRU1VIHRvIHJlcXVlc3QgTVNJIHVubWFza2lu
ZyBhdCBiaW5kIHRpbWUiKToKPiA+IFdoZW4gYSBNU0kgaW50ZXJydXB0IGlzIGJvdW5kIHRvIGEg
Z3Vlc3QgdXNpbmcKPiA+IHhjX2RvbWFpbl91cGRhdGVfbXNpX2lycSAoWEVOX0RPTUNUTF9iaW5k
X3B0X2lycSkgdGhlIGludGVycnVwdCBpcwo+ID4gbGVmdCBtYXNrZWQgYnkgZGVmYXVsdC4KPiAK
PiBBcHBsaWVkLCBhbmQgcHVzaGVkIHRoZSBjb3JyZXNwb25kaW5nIHVwZGF0ZSB0byBRRU1VX1RB
RyBpbgo+IHFlbXUteGVuLXVuc3RhYmxlLgo+IAo+IERvZXMgdGhpcyBwYXRjaCBuZWVkIHRvIGJl
IGJhY2twb3J0ZWQgdG8gZWFybGllciBYZW4gcmVsZWFzZXMgPyAgSXQKPiB3YXNuJ3QgY2xlYXIg
dG8gbWUgd2hldGhlciB0aGVyZSBpcyBuZXcgWGVuIGNvZGUgaW4gdGhpcyBhcmVhIHdpdGhvdXQK
PiB3aGljaCB0aGUgcHJvYmxlbSAod2hpY2ggdGhlIHBhdGNoIHNvbHZlcykgZG9lcyBub3QgYXJp
c2U7IG9yIHdoZXRoZXIsCj4gY29udmVyc2VseSwgc2ltcGx5IHJ1bm5pbmcgYSBuZXcgZ3Vlc3Qg
aXMgc3VmZmljaWVudC4KPiAKCkdvb2QgcXVlc3Rpb24uIEluIHRoZSBlYXJsaWVyIHRocmVhZCBh
Ym91dCB0aGlzIHBhdGNoIGl0IHdhcyBtZW50aW9uZWQKdGhlIGJ1ZyBoYXBwZW5zIHdpdGggbGF0
ZXN0IHN0YWJsZSB2ZXJzaW9uIG9mIFhlbiwgd2hpY2ggc291bmRzIGxpa2UgCnRoaXMgcGF0Y2gg
c2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8gc3RhYmxlIFhlbiB2ZXJzaW9ucy4gSXMgdGhhdCBjb3Jy
ZWN0PwoKClRoYW5rcywKCi0tIFBhc2kKCj4gUmVnYXJkcywKPiBJYW4uCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
