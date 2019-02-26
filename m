From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: xen/evtchn and forced threaded irq
Date: Tue, 26 Feb 2019 09:30:07 +0000
Message-ID: <038b837c-63c0-afb7-ca7b-75f61af7518e__41615.7333458372$1551173469$gmane$org@citrix.com>
References: <20190220000209.GA4091@localhost.localdomain>
 <a872d480-9f1b-6cd7-e507-ac4fcdf705af@arm.com>
 <21214d47-9c68-e6bf-007a-4047cc2b02f9@oracle.com>
 <8f7445d7-fa50-f3e9-44f5-cc2aebd020f4@arm.com>
 <15bc52cb-82d8-4d2c-e5a8-c6ae8de90276@oracle.com>
 <5df8888a-4a29-fccd-bac2-a9c170244029@arm.com>
 <f7e78bf6-6e65-6d6c-c1ad-dca7f1e66b17@gmail.com>
 <fe44917f-bbe9-3e0e-fdda-2eb4db9f25c2@arm.com>
 <13a9616c-2d9a-f90b-3358-f2dcadbbb64d@gmail.com>
 <dbfd87e9-48fc-f641-9e24-ddb6c4f61135@arm.com>
 <20190226091420.klgldhotiecezw6h@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pxUo=RB=citrix.com=prvs=953b1d86f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gyZ40-0002nl-DU
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 09:30:12 +0000
In-Reply-To: <20190226091420.klgldhotiecezw6h@Air-de-Roger>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko <andr2000@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dave P Martin <Dave.Martin@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDIvMjAxOSAwOToxNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEZl
YiAyNSwgMjAxOSBhdCAwMTo1NTo0MlBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhp
IE9sZWtzYW5kciwKPj4KPj4gT24gMjUvMDIvMjAxOSAxMzoyNCwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6Cj4+PiBPbiAyLzIyLzE5IDM6MzMgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIDIyLzAyLzIwMTkgMTI6MzgsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOgo+Pj4+PiBPbiAyLzIwLzE5IDEwOjQ2IFBNLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4+Pj4+PiBEaXNjdXNzaW5nIHdpdGggbXkgdGVhbSwgYSBzb2x1dGlvbiB0aGF0IGNhbWUg
dXAgd291bGQgYmUgdG8KPj4+Pj4+IGludHJvZHVjZSBvbmUgYXRvbWljIGZpZWxkIHBlciBldmVu
dCB0byByZWNvcmQgdGhlIG51bWJlciBvZgo+Pj4+Pj4gZXZlbnQgcmVjZWl2ZWQuIEkgd2lsbCBl
eHBsb3JlIHRoYXQgc29sdXRpb24gdG9tb3Jyb3cuCj4+Pj4+IEhvdyB3aWxsIHRoaXMgaGVscCBp
ZiBldmVudHMgaGF2ZSBzb21lIHBheWxvYWQ/Cj4+Pj4gV2hhdCBwYXlsb2FkPyBUaGUgZXZlbnQg
Y2hhbm5lbCBkb2VzIG5vdCBjYXJyeSBhbnkgcGF5bG9hZC4gSXQgb25seQo+Pj4+IG5vdGlmeSB5
b3UgdGhhdCBzb21ldGhpbmcgaGFwcGVuLiBUaGVuIHRoaXMgaXMgdXAgdG8gdGhlIHVzZXIgdG8K
Pj4+PiBkZWNpZGUgd2hhdCB0byB5b3Ugd2l0aCBpdC4KPj4+IFNvcnJ5LCBJIHdhcyBwcm9iYWJs
eSBub3QgcHJlY2lzZSBlbm91Z2guIEkgbWVhbiB0aGF0IGFuIGV2ZW50IG1pZ2h0IGhhdmUKPj4+
IGFzc29jaWF0ZWQgcGF5bG9hZCBpbiB0aGUgcmluZyBidWZmZXIsIGZvciBleGFtcGxlIFsxXS4g
U28sIGNvdW50aW5nIGV2ZW50cwo+Pj4gbWF5IGhlbHAgc29tZWhvdywgYnV0IHRoZSByaW5nJ3Mg
ZGF0YSBtYXkgc3RpbGwgYmUgbG9zdAo+PiBGcm9tIG15IHVuZGVyc3RhbmRpbmcgb2YgZXZlbnQg
Y2hhbm5lbHMgYXJlIGVkZ2UgaW50ZXJydXB0cy4gQnkgZGVmaW5pdGlvbiwKPiBJTU8gZXZlbnQg
Y2hhbm5lbHMgYXJlIGFjdGl2ZSBoaWdoIGxldmVsIGludGVycnVwdHMuCj4KPiBMZXQncyB0YWtl
IGludG8gYWNjb3VudCB0aGUgZm9sbG93aW5nIHNpdHVhdGlvbjogeW91IGhhdmUgYW4gZXZlbnQK
PiBjaGFubmVsIG1hc2tlZCBhbmQgdGhlIGV2ZW50IGNoYW5uZWwgcGVuZGluZyBiaXQgKGFraW4g
dG8gdGhlIGxpbmUgb24KPiBiYXJlIG1ldGFsKSBnb2VzIGZyb20gbG93IHRvIGhpZ2ggKDAgLT4g
MSksIHRoZW4geW91IHVubWFzayB0aGUKPiBpbnRlcnJ1cHQgYW5kIHlvdSBnZXQgYW4gZXZlbnQg
aW5qZWN0ZWQuIElmIGl0IHdhcyBhbiBlZGdlIGludGVycnVwdAo+IHlvdSB3b250IGdldCBhbiBl
dmVudCBpbmplY3RlZCBhZnRlciB1bm1hc2tpbmcsIGJlY2F1c2UgeW91IHdvdWxkCj4gaGF2ZSBs
b3N0IHRoZSBlZGdlLiBJIHRoaW5rIHRoZSBwcm9ibGVtIGhlcmUgaXMgdGhhdCBMaW51eCB0cmVh
dHMKPiBldmVudCBjaGFubmVscyBhcyBlZGdlIGludGVycnVwdHMsIHdoZW4gdGhleSBhcmUgYWN0
dWFsbHkgbGV2ZWwuCgpFdmVudCBjaGFubmVscyBhcmUgZWRnZSBpbnRlcnJ1cHRzLsKgIFRoZXJl
IGFyZSBzZXZlcmFsIHZlcnkgc3VidGxlIGJ1Z3MKdG8gYmUgaGFkIGJ5IHNvZnR3YXJlIHdoaWNo
IHRyZWF0cyB0aGVtIGFzIGxpbmUgaW50ZXJydXB0cy4KCk1vc3QgY3JpdGljYWxseSwgaWYgeW91
IGZhaWwgdG8gYWNrIHRoZW0sIHJlYmluZCB0aGVtIHRvIGEgbmV3IHZjcHUsIGFuZApyZWVuYWJs
ZSBpbnRlcnJ1cHRzLCB5b3UgZG9uJ3QgZ2V0IGEgbmV3IGludGVycnVwdCBub3RpZmljYXRpb24u
wqAgVGhpcwp3YXMgdGhlIHNvdXJjZSBvZiBhIDQgbW9udGggYnVnIHdoZW4gWGVuU2VydmVyIHdh
cyBtb3ZpbmcgZnJvbQpjbGFzc2ljLXhlbiB0byBQVk9wcyB3aGVyZSB1c2luZyBpcnFiYWxhbmNl
IHdvdWxkIGNhdXNlIGRvbTAgdG8Kb2NjYXNpb25hbGx5IGxvc2UgaW50ZXJydXB0cy4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
