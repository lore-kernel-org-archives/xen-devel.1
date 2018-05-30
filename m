From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: fix pv domain on amd in 4.9 stable
 branch
Date: Wed, 30 May 2018 11:33:22 +0200
Message-ID: <a0a245e4-8704-c572-d101-c54675c104e1__41803.594309795$1527672752$gmane$org@suse.com>
References: <20180529131136.15624-1-jgross@suse.com>
 <20180530083336.GC9685@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=v8ug=ir=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fNxTx-0000HW-TZ
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 09:33:25 +0000
In-Reply-To: <20180530083336.GC9685@kroah.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMTggMTA6MzMsIEdyZWcgS0ggd3JvdGU6Cj4gT24gVHVlLCBNYXkgMjksIDIwMTgg
YXQgMDM6MTE6MzZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQ29tbWl0IDk0NGUw
ZmM1MWE4OWM5ODI3Yjk4ODEzZDY1ZGMwODMyNzQ3NzdjN2YgKCJ4ODYvYW1kOiBkb24ndCBzZXQK
Pj4gWDg2X0JVR19TWVNSRVRfU1NfQVRUUlMgd2hlbiBydW5uaW5nIHVuZGVyIFhlbiIpIGJyZWFr
cyBYZW4gcHYtZG9tYWlucwo+PiBvbiBBTUQgcHJvY2Vzc29ycywgYXMgYSBwcmVyZXF1aXNpdGUg
cGF0Y2ggZnJvbSB1cHN0cmVhbSB3YXNuJ3QgYWRkZWQKPj4gdG8gNC45Lgo+IAo+IFdoYXQgaXMg
dGhlIHByZXJlcXVzaXRlIHBhdGNoJ3MgZ2l0IGlkIGluIExpbnVzJ3MgdHJlZT8KCkNvbW1pdCAw
ODA4ZTgwY2I3NjBkZTI3MzNjMDUyN2QyMDkwZWQyMjA1YTFlZWY4LiBJdCB3b24ndCBhcHBseSwK
YmFja3BvcnRpbmcgaXMgcmF0aGVyIGVhc3ksIHRob3VnaC4KCkkgdGhvdWdodCB0aGlzIHdhcyBh
IHBhdGNoIGluIHRoZSBtaWRkbGUgb2YgYSBsYXJnZXIgc2VyaWVzLCBidXQKb2J2aW91c2x5IEkg
bWlzcmVtZW1iZXJlZC4gSXQgd2FzIHRoZSBmaXJzdCBwYXRjaCBvZiB0aGF0IHNlcmllcy4KCkkn
bGwgc2VuZCBhIHNlcmllcyBpbiBjYXNlIHlvdSBkb24ndCBvYmplY3Q6CgotIHJldmVydCBvZiBz
dGFibGUtNC45IDk0NGUwZmM1MWE4OWM5ODI3Yjk4ODEzZDY1ZGMwODMyNzQ3NzdjN2YKLSBiYWNr
cG9ydCBvZiAwODA4ZTgwY2I3NjBkZTI3MzNjMDUyN2QyMDkwZWQyMjA1YTFlZWY4Ci0gbmV3IGJh
Y2twb3J0IG9mIGRlZjkzMzFhMTI5Nzc3NzBjYzYxMzJkNzlmOGU2NTY1ODcxZThlMzgKCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
