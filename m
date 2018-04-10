From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 1/9] x86/xpti: avoid copying L4 page
 table contents when possible
Date: Tue, 10 Apr 2018 11:27:11 +0200
Message-ID: <0fc996fa-e235-e3fe-e666-6c264a3cbab3@suse.com>
References: <20180410075843.6822-1-jgross@suse.com>
 <20180410075843.6822-2-jgross@suse.com> <5ACC996A02000078001B9CE9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e8hv=g7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f5pYa-00070n-Ur
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 09:27:16 +0000
In-Reply-To: <5ACC996A02000078001B9CE9@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDQvMTggMTE6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEwLjA0LjE4IGF0
IDA5OjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gRm9yIG1pdGlnYXRpb24gb2YgTWVs
dGRvd24gdGhlIGN1cnJlbnQgTDQgcGFnZSB0YWJsZSBpcyBjb3BpZWQgdG8gdGhlCj4+IGNwdSBs
b2NhbCByb290IHBhZ2UgdGFibGUgZWFjaCB0aW1lIGEgNjQgYml0IHB2IGd1ZXN0IGlzIGVudGVy
ZWQuCj4+Cj4+IENvcHlpbmcgY2FuIGJlIGF2b2lkZWQgaW4gY2FzZXMgd2hlcmUgdGhlIGd1ZXN0
IEw0IHBhZ2UgdGFibGUgaGFzbid0Cj4+IGJlZW4gbW9kaWZpZWQgd2hpbGUgcnVubmluZyB0aGUg
aHlwZXJ2aXNvciwgZS5nLiB3aGVuIGhhbmRsaW5nCj4+IGludGVycnVwdHMgb3IgYW55IGh5cGVy
Y2FsbCBub3QgbW9kaWZ5aW5nIHRoZSBMNCBwYWdlIHRhYmxlIG9yICVjcjMuCj4+Cj4+IFNvIGFk
ZCBhIHBlci1jcHUgZmxhZyBpbmRpY2F0aW5nIHdoZXRoZXIgdGhlIGNvcHlpbmcgc2hvdWxkIGJl
Cj4+IHBlcmZvcm1lZCBhbmQgc2V0IHRoYXQgZmxhZyBvbmx5IHdoZW4gbG9hZGluZyBhIG5ldyAl
Y3IzIG9yIG1vZGlmeWluZwo+PiB0aGUgTDQgcGFnZSB0YWJsZS4gIFRoaXMgaW5jbHVkZXMgc3lu
Y2hyb25pemF0aW9uIG9mIHRoZSBjcHUgbG9jYWwKPj4gcm9vdCBwYWdlIHRhYmxlIHdpdGggb3Ro
ZXIgY3B1cywgc28gYWRkIGEgc3BlY2lhbCBzeW5jaHJvbml6YXRpb24gZmxhZwo+PiBmb3IgdGhh
dCBjYXNlLgo+Pgo+PiBBIHNpbXBsZSBwZXJmb3JtYW5jZSBjaGVjayAoY29tcGlsaW5nIHRoZSBo
eXBlcnZpc29yIHZpYSAibWFrZSAtaiA0IikKPj4gaW4gZG9tMCB3aXRoIDQgdmNwdXMgc2hvd3Mg
YSBzaWduaWZpY2FudCBpbXByb3ZlbWVudDoKPj4KPj4gLSByZWFsIHRpbWUgZHJvcHMgZnJvbSAx
MTIgc2Vjb25kcyB0byAxMDMgc2Vjb25kcwo+PiAtIHN5c3RlbSB0aW1lIGRyb3BzIGZyb20gMTQy
IHNlY29uZHMgdG8gMTMxIHNlY29uZHMKPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gCj4+IC0tLQo+PiBWNjoKPj4gLSBjb3JyZWN0IGFuIGVycm9yIGZyb20g
cmViYXNpbmcgdG8gc3RhZ2luZyBpbiBhc3NlbWJseSBwYXJ0Cj4gCj4gSSBoYXZlIHRvIGFkbWl0
IHRoYXQgd2l0aG91dCBkaWdnaW5nIG91dCB2NSBJIGNhbid0IHNwb3QgdGhlCj4gY2hhbmdlLgoK
SXQgaXMgc3VidGxlLCBldmVuIG1vcmUgYXMgcGF0Y2ggMyBjb3JyZWN0ZWQgdGhlIGVycm9yIGFn
YWluLgoKSW4gcmVzdG9yZV9hbGxfZ3Vlc3QgcHZfY3IzIG11c3QgYmUgdGVzdGVkIGZvciBiZWlu
ZyB6ZXJvIGJlZm9yZQp0ZXN0aW5nIHdoZXRoZXIgdG8gY29weSB0aGUgcm9vdCBwYWdlIHRhYmxl
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
