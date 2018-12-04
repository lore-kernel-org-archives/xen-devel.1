From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V10 4/5] p2m: Always use hostp2m when
 clipping rangesets
Date: Tue, 04 Dec 2018 05:54:01 -0700
Message-ID: <5C0678E90200007800202AD6@prv1-mh.provo.novell.com>
References: <1543442182-3557-1-git-send-email-rcojocaru@bitdefender.com>
 <1543442182-3557-5-git-send-email-rcojocaru@bitdefender.com>
 <5BFFB9C0020000780020119C@prv1-mh.provo.novell.com>
 <5543e709-6dd0-4c88-ad87-5837490ea441@bitdefender.com>
 <5BFFF06B02000078002013BD@prv1-mh.provo.novell.com>
 <b1d92858-ff44-4d2f-a32f-98e5efde9cb2@bitdefender.com>
 <5C04EE1E0200007800202129@prv1-mh.provo.novell.com>
 <f1ae1d45-18d4-5266-a895-372449e1b14e@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUADI-0003as-JR
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 12:54:08 +0000
In-Reply-To: <f1ae1d45-18d4-5266-a895-372449e1b14e@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjEyLjE4IGF0IDEzOjE4LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gUmlnaHQsIHNvIHlvdSdyZSBzYXlpbmcgdGhhdCB0aGUgc2VyaWVzIHdvdWxkIGJlIGFi
bGUgdG8gZ28gaW4gcHJvdmlkZWQKPiB0aGF0IHRoZSBzaXR1YXRpb24gaXMgbm90IG1hZGUgd29y
c2UgdGhhbiBpdCBjdXJyZW50bHkgaXMuCgpXZWxsLCBJJ20gbm90IHRoZSBtYWludGFpbmVyIG9m
IHRoaXMgY29kZSwgc28gaW4gcHJpbmNpcGxlIHRoZQpzZXJpZXMgY2FuIGdvIGluIGRlc3BpdGUg
bXkgcmVzZXJ2YXRpb25zLgoKPiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgdGhlIHBhdGNoIGNoYW5n
ZXMgbm90aGluZyBmdW5jdGlvbmFsbHkgZnJvbSB0aGUKPiBjdXJyZW50IHN0YXRlIG9mIGFmZmFp
cnM6IHdoZW4gY2FsbGVkIGZvciB0aGUgaG9zdHAybSBpdCBiZWhhdmVzIGV4YWN0bHkKPiB0aGUg
c2FtZS4KPiAKPiBUaGUgb25lIGRpZmZlcmVuY2UgaXMgdGhlIGVhcmx5IHJldHVybiwgd2hpY2gg
aXMgY2VydGFpbmx5IG5vdCBtYWtpbmcKPiB0aGluZ3Mgd29yc2U6IHJhbmdlc2V0X2FkZF9yYW5n
ZSgpIHdpbGwgY3Jhc2ggdGhlIGh5cGVydmlzb3IgaW4gYW4KPiBBU1NFUlQoc3RhcnQgPD0gZW5k
KS4gSXQganVzdCBoYXBwZW5lZCB0aGF0IHRoYXQgbmV2ZXIgb2NjdXJlZCBmb3IgdGhlCj4gaG9z
dHAybSAtIHNvIGl0IHdpbGwgY29udGludWUgdG8gbm90IGhhcHBlbiBmb3IgdGhlIGhvc3RwMm0u
Cj4gCj4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIG1vcmUgZGV0YWlscyBvbiB0aGUgY2FzZSB0
aGF0IGlzIG1ha2luZyB0aGluZ3MKPiB3b3JzZT8gV2hpY2ggY2FzZXMgb2YgInN0YXJ0IiAoaWYg
dGhhdCBpcyB3aGF0IHlvdSBtZWFuKSBtYWtlIHRoaW5ncyB3b3JzZT8KCk9rYXksIEkndmUgbG9v
a2VkIGFnYWluIC0gc3RhcnQgaW5kZWVkIGRvZXNuJ3QgZ2V0IGNsaXBwZWQuIFlldCB0aGUKYWRk
ZWQgcmV0dXJuIHBhdGggcGx1cyB0aGUgY29tbWVudCBuZXh0IHRvIGl0IHN0aWxsIG1ha2UgdGhl
CnNpdHVhdGlvbiB3b3JzZSBpbW8sIGFzIHRoZXkgZnVydGhlciB0aGUgaW1wcmVzc2lvbiB0aGF0
IHRoZSBjbGlwcGluZwpvZiBlbmQgaXMgY29ycmVjdC4gT3IgaW4gb3RoZXIgd29yZHMsIHdpdGgg
dGhlIGNoYW5nZSBpdCdsbCBiZSBsZXNzCnZpc2libGUgdGhhdCB0aGVyZSdzIGEgKHBlcmhhcHMg
anVzdCB0aGVvcmV0aWNhbCwgYXMgc2FpZCkgYnVnIGhlcmUuCkhlbmNlIG15IGRlc2lyZSB0byBn
ZXQgdGhlIGJ1ZyBhZGRyZXNzZWQgd2hpbGUgdGhpcyBjb2RlIGlzCmJlaW5nIGJhc2ljYWxseSBy
ZS1kb25lIGFueXdheS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
