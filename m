From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 0/2] Dangling fixes for ARM iommu
Date: Tue, 22 Jan 2019 15:48:56 +0200
Message-ID: <77aca14e-dd88-855c-4d7f-2e3a600a5e7a@gmail.com>
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <c760919c-e635-ee39-6c74-fcac97dc060d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqM6=P6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1glwQH-0001IK-Tg
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 13:49:01 +0000
Received: by mail-lj1-x244.google.com with SMTP id k19-v6so20605385lji.11
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jan 2019 05:49:00 -0800 (PST)
In-Reply-To: <c760919c-e635-ee39-6c74-fcac97dc060d@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjEuMDEuMTkgMTk6MjksIEp1bGllbiBHcmFsbCB3cm90ZToKPiAo
KyBKdWVyZ2VuKQo+IEFsbCBwYXRjaGVzIGNhbmRpZGF0ZSBmb3IgWGVuIDQuMTIgc2hvdWxkIGhh
dmUgdGhlIHJlbGVhc2UgbWFuYWdlciBDQ2VkIGFuZCBleHBsYWluIHRoZSBwcm9zL2NvbnMgdG8g
aGF2ZSB0aG9zZSBwYXRjaGVzIGZvciB0aGlzIHJlbGVhc2UuIEl0IGlzIGFsc28gdXNlZnVsIGlm
IHlvdSBhZGQgZm9yLTQuMTIgKG9yIHNpbWlsYXIpIGluIHRoZSBbLi4uXSBzbyB3ZSBjYW4gcHJp
b3JpdGl6ZSBpdC4KCkkndmUgZ290IHRoZSBwb2ludC4gVGhhbmsgeW91IGZvciBhZGRpbmcgSnVl
cmdlbi4KCj4gSW5kZWVkIGNvZGUgYmFzZSBldm9sdmVkLCBmb3IgaW5zdGFuY2UgaW9tbXVfdXNl
X2hhcF9wdCBoYXMgYSBzbGlnaHQgZGlmZmVyZW50IGJlaGF2aW9yIG5vdy4KCkFjdHVhbGx5IHlv
dSBwcm9wZXJseSBwb2ludGVkIHRoZSBwcm9ibGVtLiBJJ20gbm90IHN1cmUgaG93IGl0IGhhcHBl
bmVkLCBiZWNhdXNlIEkgZGlkIHRlc3QgYnVpbGQgYW5kIHJ1biBmb3IgdGhvc2UgcGF0Y2hlcyB5
ZXN0ZXJkYXkuIEJ1dCBub3csIHByb2dyZXNzaW5nIHdpdGggb3VyIHN0dWZmIHBvcnRpbmcsIEkg
cmVhbGl6ZWQgdGhhdCB0aGUgcGF0Y2ggMSBpcyBtaXNzaW5nIGRlcGVuZGVuY3kgb24gYHhlbi9z
Y2hlZC5oYCByZXF1aXJlZCBieSBgaW9tbXVfdXNlX2hhcF9wdGAuCgo+IFNvIHBsZWFzZSBzdHJp
cHBlZCBteSBSQgpPSy4KCj4gVGhlIEFCIGlzIGFyZ3VhYmxlIGFzIGl0IGlzIHF1aXRlIG9sZC4K
SSBjb3VsZCBkcm9wIGl0IGZvciB2Mi4KCj4gU2Vjb25kbHksIGl0IG9mdGVuIGhhcHBlbnMgdGhh
dCBzb21lIHBhdGNoZXMgaGF2ZSB0aGUgcmVxdWlyZWQgYWNrZWQtYnkgYW5kIHJldmlld2VkLWJ5
IGJ1dCBhcmUgbm90IG1lcmdlZCBiZWNhdXNlIHRoZXkgbWFrZXMgbGl0dGxlIHNlbnNlIHdpdGhv
dXQgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcy4gCgpZZXMsIHN1cmUsIGJ1dCBmaXhlcyBhcmUgc3Rp
bGwgcmVsZXZhbnQgYW5kIGFyZSBxdWl0ZSBhdXRvbm9tb3VzLiBUaGUgb25seSByZWxhdGlvbiB0
byB0aGUgc2VyaWVzIGlzIHRoYXQgdGhleSB3ZXJlIGRpc2NvdmVyZWQgZHVyaW5nIGl0cyBpbXBs
ZW1lbnRhdGlvbi4KCj4gSW4gdGhhdCBjYXNlLCB0aGUgY3VycmVudCBjb2RlIGJhc2UgZG9lcyBu
b3Qgc3VwcG9ydCB0aGUgY2FzZSB3aGVyZSB0aGUgUDJNIGlzIG5vdCBzaGFyZWQgd2l0aCB0aGUg
SU9NTVUgYW5kIGRvZXMgbm90IHN1cHBvcnQgbmV3IElPTU1VIGJpbmRpbmdzIGluIHRoZSBjdXJy
ZW50IHNldHVwLgoKSXQgaXMgdGhlIGludGVudGlvbiBvZiB0aGUgcmVzdCBvZiB0aGUgc2VyaWVz
LgoKPiBTbyBJIGFtIG5vdCBjb252aW5jZWQgdGhleSBzaG91bGQgYmUgaW5jbHVkZWQgaW4gWGVu
IDQuMTIgb3IgZXZlbiB3aXRob3V0IHRoZSByZXN0IG9mIHRoZSBzZXJpZXMuCklNTywgdGhlIHB1
cmUgZml4ZXMsIGxpa2UgcGF0Y2ggMiwgYW5kIHRoZSBmaXJzdCBodW5rIG9mIHBhdGNoIDEgc2hv
dWxkIGJlIE9LIGZvciA0LjEyLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
