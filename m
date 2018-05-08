From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH 0/3] Document intent for supported build
 platforms and bump min glib to 2.42
Date: Tue, 8 May 2018 16:47:48 +0100
Message-ID: <CAFLBxZbsSPW1E7GAVPmQ8AnmQCqs16qx4r3Cq2q+sFsn48NYLA@mail.gmail.com>
References: <20180504160026.14017-1-berrange@redhat.com>
 <20180504210001.GB30250@redhat.com>
 <CAFLBxZYO7Yeje8HROjJY9P=9bEQ8RCBhA9fqbGTXN_87U5sowA@mail.gmail.com>
 <20180508151026.GA5967@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rrhy=h3=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1fG4qE-0001Iq-SP
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 15:47:51 +0000
Received: by mail-qt0-x236.google.com with SMTP id m16-v6so41571986qtg.13
 for <xen-devel@lists.xenproject.org>; Tue, 08 May 2018 08:47:49 -0700 (PDT)
In-Reply-To: <20180508151026.GA5967@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Jan Beulich <JBeulich@suse.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Markus Armbruster <armbru@redhat.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org, Olaf Hering <olaf@aepfle.de>, Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgOCwgMjAxOCBhdCA0OjEwIFBNLCBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJy
YW5nZUByZWRoYXQuY29tPiB3cm90ZToKPj4gV2l0aCBteSBYZW4gbWFpbnRhaW5lciBoYXQgb246
IEkgd291bGRuJ3QgZmVlbCBqdXN0aWZpZWQsIHBlcnNvbmFsbHksCj4+IGluIGFza2luZyBhbm90
aGVyIHByb2plY3QgdG8gY29udGludWUgc3VwcG9ydGluZyBvbGRlciB2ZXJzaW9ucy4gIElmCj4+
IHdlIGRpZG4ndCB3YW50IHRvIGJ1bXAgb3VyIG93biBnbGliIHZlcnNpb24sIHdlIHdvdWxkIGhh
dmUgdG8gZGlzYWJsZQo+PiAidXBzdHJlYW0iIFFFTVUgKGFzIG9wcG9zZWQgdG8gWGVuJ3Mgb2xk
IHFlbXUgZm9yaykgZm9yIG9sZGVyIHZlcnNpb25zCj4+IG9mIGdsaWIuCj4KPiBPciBjb3VsZCB5
b3Ugc2F5IHRoYXQgcGVvcGxlIG5lZWQgdG8gdXNlIGEgc3RhYmxlIHZlcnNpb24gb2YgUUVNVSA/
Cj4gZWcgdXNlcnMgd2FudGluZyBYZW4gb24gUkhFTC02LCBjYW4gdXNlICJ1cHN0cmVhbSIgUUVN
VSwgYnV0IHRoZXknbGwKPiBuZWVkIHRvIHN0aWNrIHdpdGggdGhlIDIuMTIgc3RhYmxlIGJyYW5j
aCB2ZXJzaW9uIC0gbm90IHVzZSBnaXQgbWFzdGVyCj4gb3IgZnV0dXJlIHJlbGVhc2VzLiBJIGd1
ZXNzIGl0IGRlcGVuZHMgd2hldGhlciB5b3UgY2FuIGV4cGVjdCAyLjEyCj4gUUVNVSB0byBjYXJy
eSBvbiB3b3JraW5nIGNvcnJlY3RseSB3aXRoIG9uZ29pbmcgWGVuIGNoYW5nZXMuCgpZZXMsIHRo
YXQncyBhIGdvb2QgcG9pbnQuICBJbiB0aGVvcnkgb2xkZXIgdmVyc2lvbnMgb2YgUUVNVSBzaG91
bGQgaW4KdGhlb3J5IGNvbnRpbnVlIHdvcmtpbmcgd2l0aCBuZXdlciB2ZXJzaW9ucyBvZiBYZW4u
CgpUd28gcG9pbnRzIGFib3V0IHRoYXQgc29sdXRpb246CgoxLiBPdXIgcmVsZWFzZSB0YXJiYWxs
IGN1cnJlbnRseSBzaGlwcyB3aXRoIGEgc25hcHNob3R0ZWQgdmVyc2lvbiBvZiBhCnNwZWNpZmlj
IHZlcnNpb24gb2YgUUVNVSwgYW5kIGlmIHlvdSBjaGVjayBvdXQgYSByZWxlYXNlIHRhZyBpbiBv
dXIKZ2l0IHJlcG8gaXQgd2lsbCBieSBkZWZhdWx0IGNsb25lIGEgc3BlY2lmaWMgdmVyc2lvbiBv
ZiBxZW11IGZvciB5b3UuClVzZXJzIC8gZG93bnN0cmVhbXMgd291bGQgaGF2ZSB0byBkaXNhYmxl
IHRoYXQgYW5kIGNsb25lIHRoZWlyIG93bgp2ZXJzaW9uLgoKMi4gV2hpbGUgaW4gdGhlb3J5IGFs
bCB2ZXJzaW9ucyBzaG91bGQgY29udGludWUgdG8gd29yaywgaW4gcHJhY3RpY2UKb3VyIHRlc3Rp
bmcgc3lzdGVtIGFuZCB0aGUgbWFqb3JpdHkgb2Ygb3VyIGRvd25zdHJlYW1zIHVzZSB0aGUgdmVy
c2lvbgpzcGVjaWZpZWQgYnkgdGhlIHJlbGVhc2UsIGV2ZW4gd2hlbiB0aGV5IGJ1aWxkIFFFTVUg
c2VwYXJhdGVseS4gIChJCnRoaW5rIERlYmlhbiBtYXkgYmUgYW4gZXhjZXB0aW9uIHRvIHRoaXMg
cnVsZSBidXQgSSdtIG5vdCBzdXJlLikKVXNpbmcgYW4gb2xkZXIgdmVyc2lvbiBvZiBRRU1VIGRv
ZXMgbWVhbiBnb2luZyAib2ZmIHRoZSBiZWF0ZW4gdHJhY2siCmEgYml0LCBpbmNyZWFzaW5nIHNs
aWdodGx5IHRoZSBjaGFuY2Ugb2YgcmFuZG9tIGJ1Z3MuCgpBbnl3YXksIGZyb20gd2hhdCBJIGNh
biB0ZWxsLCB5b3VyIGRlY2lzaW9uIHNvdW5kcyBlbnRpcmVseQpyZWFzb25hYmxlLCBhbmQgdXNl
cnMgYW5kIGRvd25zdHJlYW1zIHdobyBkb24ndCB3YW50IHRvIC8gY2FuJ3QgdXBkYXRlCmdsaWIg
aGF2ZSBhIG51bWJlciBvZiBvcHRpb25zLCBzbyBJIHBlcnNvbmFsbHkgZG9uJ3Qgc2VlIGFueSBn
cm91bmRzCmZvciBvYmplY3Rpbmcgb3IgY29tcGxhaW5pbmcuICBUaGFua3MgYWdhaW4gZm9yIHRo
ZSBoZWFkcy11cC4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
