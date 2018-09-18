From: Dag Nygren <dag@newtech.fi>
Subject: Re: [PATCH v2] tpm: Restore functionality to xen vtpm
 driver.
Date: Tue, 18 Sep 2018 09:54:47 +0300
Message-ID: <6898808.CzJHl40L0f@eseries.newtech.fi>
References: <20180913212551.2435-1-boris.ostrovsky@oracle.com>
 <20180917211900.GD6716@linux.intel.com>
 <5d63093d-620d-80d5-1138-0332a210d61f@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xcrp=ma=newtech.fi=dag@srs-us1.protection.inumbo.net>)
 id 1g29uN-0005Kw-8P
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 06:54:51 +0000
In-Reply-To: <5d63093d-620d-80d5-1138-0332a210d61f@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com, "Dr . Greg Wettstein" <greg@enjellic.com>, dunlapg@umich.edu, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, jgg@ziepe.ca, "Dr. Greg Wettstein" <greg@wind.enjellic.com>, stable@vger.kernel.org, linux-integrity@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, peterhuewe@gmx.de
List-Id: xen-devel@lists.xenproject.org

T24gdGlzZGFnIDE4IHNlcHRlbWJlciAyMDE4IGtsLiAwMToyNToyOSBFRVNUIEJvcmlzIE9zdHJv
dnNreSB3cm90ZToKPiBPbiA5LzE3LzE4IDU6MTkgUE0sIEphcmtrbyBTYWtraW5lbiB3cm90ZToK
Cj4gPiBKdXN0IHRvIHVuZGVyc3RhbmQgdGhpcyBidWcgYmV0dGVyIHdoeSBkaWQgbm90IHRoZSB3
cm9uZyB2ZXJzaW9uCj4gPiBjYXVzZSBhbnkgdW5kZWZpbmVkIGJlaGF2aW9yPyBTb3VuZHMgbGlr
ZSBhIGZhdGFsIGJ1Zy4gRG9lcyB0aGlzCj4gPiBjYXVzZSBjcmFzaGVzPwo+IAo+IEFGQUlLLCBu
bywgbm8gY3Jhc2hlcy4gSSBoYXZlbid0IHRlc3RlZCB0aGlzIG15c2VsZiAoYW5kIEkgYmVsaWV2
ZQo+IHJlbGF0aXZlbHkgZmV3IHBlb3BsZSB1c2UgdGhpcyBmdW5jdGlvbmFsaXR5LCB3aGljaCBl
eHBsYWlucyB3aHkgdGhpcwo+IGhhcyBub3QgYmVlbiBmaXhlZCBmb3Igc28gbG9uZykgYnV0IEkg
ZG9uJ3QgdGhpbmsgaXQgd2lsbCBuZWNlc3NhcmlseQo+IGNyYXNoLiBJdCdzIGp1c3QgdGhhdCB0
aGUgZnJvbnRlbmQgZHJpdmVyIHdpbGwgYmUgcmVhZGluZyBmcm9tIHdyb25nCj4gbG9jYXRpb24s
IGNhdXNpbmcgVFBNIG5vdCB0byBmdW5jdGlvbiBwcm9wZXJseS4KCkkgYnVtcGVkIG15IGhlYWQg
aW50byB0aGlzIGxhc3Qgd2VlayBhbmQgc3BlbnQgbW9zdCBvZiB0aGUKd2VlayB0cnlpbmcgdG8g
ZmlndXJlIG91dCB3aHkgdGhlIHZ0cG0gZGlkIG5vdCByZXNwb25kLgpGaW5hbGx5IGZvdW5kIHRo
ZSBlbWFpbCBmcm9tIHRoZSBndXkgdGhhdCBkaXJzY292ZXJlZCBhbmQgZml4ZWQKaXQuIERpZCB0
aGUgZml4IGFuZCByZXNjb21waWxlZC4gTm93IGl0IHNlZW1zIHRvIGJlIHdvcmtpbmcKZmluZS4g
VGhlIHBhdGNoIGlzIHN1cnByaXNpbmdseSAyIHllYXJzIG9sZCEhCkkgd2lsbCBiZSB2ZXJ5IHBs
ZWFzZWQgdG8gc2VlIGl0IGdvIGluIHRvIHRoZQpvZmZpY2lhbCBrZXJuZWwhCgpCdXQgbm8gY3Jh
c2guIEp1c3QgYSB0aW1lb3V0IHdoZW4gdHJ5aW5nIHRvIGNvbW11bmljYXRlIHdpdGgKdGhlIHZ0
cG0tZW5naW5lLgoKQmVzdApEYWcKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
