From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] shut down domain when last vCPU goes down
Date: Fri, 16 Feb 2018 17:45:47 +0100
Message-ID: <e8ee3352-4e02-0037-01b0-9527790dfbe4@suse.com>
References: <5A87028802000078001A8759@prv-mh.provo.novell.com>
 <20180216155248.ni6vg3botbbwvb74@MacBook-Pro-de-Roger.local>
 <5A87140402000078001A8847@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zjwl=fk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1emj93-0001Vp-An
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 16:45:57 +0000
In-Reply-To: <5A87140402000078001A8847@prv-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDIvMTggMTc6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjAyLjE4IGF0
IDE2OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiBGcmksIEZlYiAxNiwg
MjAxOCBhdCAwODoxMDo0OEFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEkndmUganVz
dCBoYWQgdG8gZGVhbCB3aXRoIGFuIGVhcmx5IGJvb3QgY3Jhc2ggb2YgTGludXggd2hpY2ggb2Nj
dXJyZWQKPj4+IHNvIGVhcmx5IHRoYXQgZXZlbiAiZWFybHlwcmludGs9eGVuIiBkaWQgbm90IHBy
b2R1Y2UgYW55IHVzZWZ1bCBvdXRwdXQuCj4+PiBIZW5jZSB0aGUgZG9tYWluIGFwcGVhcmVkIHRv
IGhhbmcsIHdoaWxlIGluIGZhY3QgaXQgaGFkIGJyb3VnaHQgZG93biBpdHMKPj4+IG9ubHkgdkNQ
VS4gQnkgdHJhbnNsYXRpbmcgdGhpcyB0byBhIHNodXRkb3duLCB0aGUgc2l0dWF0aW9uIHdpbGwg
YmUKPj4+IGJldHRlciByZWNvZ25pemFibGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+Cj4+IEknbSB3b25kZXJpbmcsIGlzIGl0IGNv
bW1vbiBmb3IgYSBkb21haW4gdG8gc2h1dGRvd24gYnkgc2h1dHRpbmcgZG93bgo+PiBhbGwgaXQn
cyB2Q1BVcz8KPj4KPj4gSW4gdGhlIHNjZW5hcmlvIHRoYXQgeW91IGRlc2NyaWJlIGFib3ZlIGl0
IHNlZW1zIGl0IHdvdWxkIGJlIG1vcmUKPj4gaGVscGZ1bCB0byBpc3N1ZSBhIFNIVVRET1dOX2Ny
YXNoIGluc3RlYWQgbWF5YmUgd2l0aCBhIGdkcHJpbnRrCj4+IG1lc3NhZ2UgaW4gb3JkZXIgdG8g
YWlkIGRlYnVnZ2luZy4KPiAKPiBTZWVpbmcgdGhpcyBJIHdhcyBwdXp6bGVkIHRvbzsgSSBoYXZl
IG5vIGlkZWEgd2h5IExpbnV4IGRvZXMgdGhpcywKPiBvdGhlciB0aGFuIHRoaXMgYmVpbmcgYW4g
YXR0ZW1wdCB0byBwcm92aWRlIGEgUFYgZXF1aXZhbGVudCBvZiB0aGUKPiBITFQgaW5zdHJ1Y3Rp
b24uIEJ1dCBubywgU0hVVERPV05fY3Jhc2ggaXMgbm90IGFwcHJvcHJpYXRlIGltbwo+IChhbmQg
SSBkaWQgY29uc2lkZXIgaXQpIC0gd2UgY2FuJ3Qga25vdyB3aGF0IHRoZSByZWFzb24gd2FzIGZv
ciB0aGUKPiBndWVzdCB0byBpc3N1ZSB0aGUgaHlwZXJjYWxsOyBpbiBwYXJ0aWN1bGFyIHdlIHNo
b3VsZG4ndCB0cmlnZ2VyCj4gYWN0aW9ucyAobGlrZSBkdW1waW5nKSB0aGF0IGFyZSBsaWtlbHkg
dGllZCB0byBhIGNyYXNoIHVubGVzcyB3ZSdyZQo+IHN1cmUgdGhlcmUgd2FzIGEgY3Jhc2guCgpM
aW51eCBkb2VzIHRoaXMgaW4gY2FzZSBvZiBoaXR0aW5nIGFuIGV4Y2VwdGlvbiBiZWZvcmUgdGhl
IGNvbW1vbiB0cmFwCmhhbmRsaW5nIGlzIHNldCB1cC4gSXQganVzdCBpcyB1c2luZyBoYWx0KCkg
d2hpY2ggd2lsbCBpc3N1ZSB0aGUgaGx0Cmluc3RydWN0aW9uIG9uIGJhcmUgbWV0YWwgYW5kIGlz
IGNhbGxpbmcgVkNQVV9kb3duIGluIGEgcHYgZ3Vlc3Qgd2hlbgppbnRlcnJ1cHRzIGFyZSBvZmYu
IEluIGNhc2UgdGhlIGNvbnNvbGUgd291bGQgaGF2ZSBiZWVuIHNldCB1cCBhbHJlYWR5CnlvdSB3
b3VsZCBoYXZlIHNlZW4gcmVnaXN0ZXJzIHByaW50ZWQuCgpXaGF0IGNvdWxkIGJlIGRvbmUgaXMg
dXNpbmcgYW4gZWFybHkgcHYtb3AgZm9yIHRoZSBobHQgaW5zdHJ1Y3Rpb24KdHJhbnNsYXRpbmcg
dG8gU0hVVERPV05fY3Jhc2ggaW4gY2FzZSBvZiBpbnRlcnJ1cHRzIG9mZiBhbmQgc3dpdGNoaW5n
CnRvIHRoZSBjdXJyZW50IHZhcmlhbnQgd2hlbiB0cmFwIGhhbmRsaW5nIGhhcyBiZWVuIGluaXRp
YWxpemVkLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
