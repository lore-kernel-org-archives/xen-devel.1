From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] Document intent for supported build
 platforms and bump min glib to 2.42
Date: Tue, 8 May 2018 17:05:06 +0200
Message-ID: <ea788b49-07c7-f12f-2a17-98efb2ab6324@redhat.com>
References: <20180504160026.14017-1-berrange@redhat.com>
 <20180504210001.GB30250@redhat.com>
 <CAFLBxZYO7Yeje8HROjJY9P=9bEQ8RCBhA9fqbGTXN_87U5sowA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fcsc=h3=gmail.com=paolo.bonzini@srs-us1.protection.inumbo.net>)
 id 1fG4B8-0006jD-7C
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 15:05:22 +0000
Received: by mail-wm0-x244.google.com with SMTP id x12-v6so19553156wmc.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 May 2018 08:05:21 -0700 (PDT)
In-Reply-To: <CAFLBxZYO7Yeje8HROjJY9P=9bEQ8RCBhA9fqbGTXN_87U5sowA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>, "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Jan Beulich <JBeulich@suse.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Markus Armbruster <armbru@redhat.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org, Olaf Hering <olaf@aepfle.de>, Stefan Hajnoczi <stefanha@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDUvMjAxOCAxNjo1MCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBUYWlsaW5nIGludG8g
dGhhdCwgd2l0aCBteSBDZW50T1MgcGFja2FnZSBtYWludGFpbmVyIGhhdCBvbjogWW91IHNhaWQK
PiB0aGF0IHRoZSBjb2RlIGluIHF1ZXN0aW9uIGNvbXBpbGVkIG9uIFJIRUwgNiBiZWNhdXNlIFJI
IGhhZCBiYWNrcG9ydGVkCj4gdGhlIGZ1bmN0aW9uIGluIHF1ZXN0aW9uLiAgV2lsbCBRRU1VIGNv
bnRpbnVlIHRvIGFjdHVhbGx5IGNvbXBpbGUgb24KPiBSSEVMIDYgLyBDZW50T1MgNj8gIEkuZS4s
IHdpbGwgY29uZmlndXJlIGJlIGNoZWNraW5nIGZvciB0aGF0Cj4gZnVuY3Rpb24sIG9yIG9ubHkg
Y2hlY2tpbmcgZm9yIHRoZSB2ZXJzaW9uIG51bWJlcj8KClRoZSBsYXR0ZXIsIGJlY2F1c2Ugd2Un
cmUgYWxzbyBkcm9wcGluZyBhbGwgdGhlIGNvbXBhdGliaWxpdHkgY29kZSB0aGF0CmFsbG93ZWQg
UUVNVSB0byBjb21waWxlIG9uIG9sZGVyIGdsaWIgdmVyc2lvbnMuCgpQYW9sbwoKPiBJZiB0aGUg
Zm9ybWVyLCB0aGVuIHRoZSBDZW50T1MgNiBYZW4gcGFja2FnZXMgd29uJ3QgYmUgYWZmZWN0ZWQu
ICBJZgo+IHRoZSBsYXR0ZXIsIHRoZW4gYXQgc29tZSBwb2ludCBJJ2xsIGhhdmUgdG8gc3RvcCB1
cGRhdGluZyB0aGUgWGVuCj4gdmVyc2lvbiBmb3IgQ2VudE9TIDYgLS0gYnV0IGFzIHRoZSBDZW50
T1MgNiBFT0wgaXMgY29taW5nIHVwIGluIDIwMjAsCj4gaXQgc2hvdWxkbid0IGJlIHRvbyBtdWNo
IG9mIGEgaGFyZHNoaXAuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
