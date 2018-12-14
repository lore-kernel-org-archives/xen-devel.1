From: Greg Kurz <groug@kaod.org>
Subject: Re: [SPAM] [Qemu-ppc] [PATCH 2/2] avoid TABs in files
 that only contain a few
Date: Fri, 14 Dec 2018 11:54:35 +0100
Message-ID: <20181214115435.10e0b5a4__48484.5535750084$1544784850$gmane$org@bahia.lan>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rBNN=OX=kaod.org=groug@srs-us1.protection.inumbo.net>)
 id 1gXl7q-00030Z-UX
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 10:55:22 +0000
Received: from player787.ha.ovh.net (unknown [10.109.160.244])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 2F5821C66D7
 for <xen-devel@lists.xenproject.org>; Fri, 14 Dec 2018 11:55:19 +0100 (CET)
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <famz@redhat.com>, Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open
 list:bochs" <qemu-block@nongnu.org>, Stefan Markovic <smarkovic@wavecomp.com>, John Snow <jsnow@redhat.com>, Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>, Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>Amit Shah <am>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxMyBEZWMgMjAxOCAyMzozNzozNyArMDEwMApQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKCj4gTW9zdCBmaWxlcyB0aGF0IGhhdmUgVEFCcyBvbmx5IGNv
bnRhaW4gYSBoYW5kZnVsIG9mIHRoZW0uICBDaGFuZ2UKPiB0aGVtIHRvIHNwYWNlcyBzbyB0aGF0
IHdlIGRvbid0IGNvbmZ1c2UgcGVvcGxlLgo+IAo+IGRpc2FzLCBzdGFuZGFyZC1oZWFkZXJzLCBs
aW51eC1oZWFkZXJzIGFuZCBsaWJkZWNudW1iZXIgYXJlIGltcG9ydGVkCj4gZnJvbSBvdGhlciBw
cm9qZWN0cyBhbmQgcHJvYmFibHkgc2hvdWxkIGJlIGV4ZW1wdGVkIGZyb20gdGhlIGNoZWNrLgo+
IE91dHNpZGUgdGhvc2UsIGFmdGVyIHRoaXMgcGF0Y2ggdGhlIGZvbGxvd2luZyBmaWxlcyBzdGls
bCBjb250YWluIGJvdGgKPiA4LXNwYWNlIGFuZCBUQUIgc2VxdWVuY2VzIGF0IHRoZSBiZWdpbm5p
bmcgb2YgdGhlIGxpbmUuICBNYW55IG9mIHRoZW0KPiBoYXZlIGEgbWFqb3JpdHkgb2YgVEFCcywg
b3Igd2VyZSBpbml0aWFsbHkgY29tbWl0dGVkIHdpdGggYWxsIHRhYnMuCj4gCj4gWy4uLl0KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgo+IC0t
LQoKVGhpcyBhIGxvdCBvZiBwbGFjZXMgdG8gcmV2aWV3Li4uIEZXSVcgc3RnaXQgc3BvdHRlZCBh
IHRyYWlsaW5nCndoaXRlc3BhY2UgZm9yIGZyZWUgOikKCj4gIAo+IGRpZmYgLS1naXQgYS90YXJn
ZXQvY3Jpcy9oZWxwZXIuYyBiL3RhcmdldC9jcmlzL2hlbHBlci5jCj4gaW5kZXggZDJlYzM0OTE5
MS4uNzU0ZmEwMGQwNiAxMDA2NDQKPiAtLS0gYS90YXJnZXQvY3Jpcy9oZWxwZXIuYwo+ICsrKyBi
L3RhcmdldC9jcmlzL2hlbHBlci5jCj4gQEAgLTI0MCw3ICsyNDAsNyBAQCB2b2lkIGNyaXNfY3B1
X2RvX2ludGVycnVwdChDUFVTdGF0ZSAqY3MpCj4gICAgICAgICAgLyogRXhjZXB0aW9uIHN0YXJ0
cyB3aXRoIGRzbG90IGNsZWFyZWQuICAqLwo+ICAgICAgICAgIGVudi0+ZHNsb3QgPSAwOwo+ICAg
ICAgfQo+IC0JCj4gKyAgICAgICAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
