From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 16/16] configure: do_compiler: Dump some
 extra info under bash
Date: Mon, 23 Apr 2018 17:38:53 +0100
Message-ID: <23262.3101.567189.675156@mariner.uk.xensource.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-17-git-send-email-ian.jackson@eu.citrix.com>
 <20180423162142.GG1980@perard>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n26l=hm=citrix.com=prvs=644ea31d5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fAeUm-0000Qb-8T
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 16:39:16 +0000
In-Reply-To: <20180423162142.GG1980@perard>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Janosch Frank <frankja@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Kent R. Spillner" <kspillner@acm.org>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCAxNi8xNl0gY29uZmlndXJlOiBkb19j
b21waWxlcjogRHVtcCBzb21lIGV4dHJhIGluZm8gdW5kZXIgYmFzaCIpOgo+IE9uIFRodSwgQXBy
IDE5LCAyMDE4IGF0IDA1OjQ1OjE5UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gK2Z1
bmNzOiAke0ZVTkNOQU1FfQo+ID4gK2xpbmVzOiAke0JBU0hfTElORU5PfQo+ID4gK2ZpbGVzOiAk
e0JBU0hfU09VUkNFfSIKPiA+ICAgICAgZWNobyAkY29tcGlsZXIgIiRAIiA+PiBjb25maWcubG9n
Cj4gPiAgICAgICRjb21waWxlciAiJEAiID4+IGNvbmZpZy5sb2cgMj4mMSB8fCByZXR1cm4gJD8K
PiA+ICAgICAgIyBUZXN0IHBhc3NlZC4gSWYgdGhpcyBpcyBhbiAtLWVuYWJsZS13ZXJyb3IgYnVp
bGQsIHJlcnVuCj4gCj4gSG93IGlzIHRoaXMgdXNlZnVsbD8gQWxsIEkgaGF2ZSBpbiBteSBjb25m
aWcubG9nIGlzIGEgbG90IG9mOgo+ICAgZnVuY3M6IGRvX2NvbXBpbGVyCj4gICBsaW5lczogOTEK
PiAgIGZpbGVzOiAuL2NvbmZpZ3VyZQo+IAo+IEFuZCBvbmU6Cj4gICBmdW5jczogZG9fY29tcGls
ZXIKPiAgIGxpbmVzOiA5NQo+ICAgZmlsZXM6IC4vY29uZmlndXJlCj4gCj4gSXQgc3RpbGwgZG9u
J3QgdGVsbCBtZSB3aGljaCB0ZXN0IGhhZCBydW5uZWQuCgpZb3UgYXJlIHJpZ2h0LiAgUGVyaGFw
cyBteSB0ZXN0aW5nIHdhcyBpbmFkZXF1YXRlLiAgSSB3cm90ZSB0aGlzIGEKbG9uZyB3aGlsZSBh
Z28sIGFuZCBpZiB0aGVyZSB3YXMgYSBzeW50YXggYWxvbmcgdGhlc2UgbGluZXMgdGhhdCBEVFJU
CmluIGJvdGggYmFzaCBhbmQgZGFzaCBpbiBteSB0ZXN0cyBpdCBpcyBsb25nIGdvbmUuICBTdGFy
dGluZyBkZSBub3ZvLAp0aGUgZm9sbG93aW5nIGNvZGUgd29ya3MgZm9yIG1lOgoKICAgIChlY2hv
ID4+Y29uZmlnLmxvZyAiCiBmdW5jczogJHtGVU5DTkFNRVsqXX0KIGxpbmVzOiAke0JBU0hfTElO
RU5PWypdfQogZmlsZXM6ICR7QkFTSF9TT1VSQ0VbKl19IikgMj4vZGV2L251bGwgfHw6CgpXaXRo
IGJhc2ggSSBnZXQgdGhlIGV4cGVjdGVkIGluZm9ybWF0aW9uIGluIGNvbmZpZy5sb2csIHdoaWNo
IGxvb2tzCmxpa2UgdGhpczoKCiBmdW5jczogZG9fY29tcGlsZXIgZG9fY2MgY29tcGlsZV9wcm9n
IGNjX2hhc193YXJuaW5nX2ZsYWcgbWFpbgogbGluZXM6IDkxIDEyNCAxNzIwIDE3MjQgMAogZmls
ZXM6IC4vY29uZmlndXJlIC4vY29uZmlndXJlIC4vY29uZmlndXJlIC4vY29uZmlndXJlIC4vY29u
ZmlndXJlCgpXaXRoIGRhc2ggdGhlIHNjcmlwdCBydW5zIGJ1dCB0aGVyZSBpcyBub3RoaW5nIGZy
b20gdGhpcyBzZWdtZW50IGluCnRoZSBsb2cuICBXaXRob3V0IHRoZSAyPi9kZXYvbnVsbCwgaXQg
cHJpbnRzCiAgLi9jb25maWd1cmU6IDYzOiAuL2NvbmZpZ3VyZTogQmFkIHN1YnN0aXR1dGlvbgpz
byB0aGUgc3ludGF4IGVycm9yIGlzIGluZGVlZCBiZWluZyBzdXBycmVzZWQgYW5kIGlnbm9yZWQu
CgpUaGUgKCApIGlzIG5lY2Vzc2FyeSBiZWNhdXNlIHN5bnRheCBlcnJvcnMgYXJlIG5vdCBsaWtl
IHNldCAtZSBlcnJvcnM6CnRoZXkgY2F1c2UgdGhlIHNoZWxsIHByb2Nlc3MgdG8gZXhpdC4KCkkg
d2lsbCB1cGRhdGUgdGhlIHBhdGNoIGFuZCBwdXQgc29tZSBvZiB0aGlzIGluZm8gaW4gdGhlIGNv
bW1pdAptZXNzYWdlLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
