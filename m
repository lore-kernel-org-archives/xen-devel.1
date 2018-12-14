From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a
 few
Date: Fri, 14 Dec 2018 12:35:53 +0100
Message-ID: <a01bfb15-d1b7-d2e1-bd29-6e7a9899ed0d__7635.98889248005$1544787330$gmane$org@redhat.com>
References: <20181213223737.11793-1-pbonzini@redhat.com>
 <20181213223737.11793-3-pbonzini@redhat.com>
 <20181214102211.GF4265@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w49m=OX=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gXllf-0006vZ-6O
 for xen-devel@lists.xenproject.org; Fri, 14 Dec 2018 11:36:31 +0000
In-Reply-To: <20181214102211.GF4265@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Fam Zheng <famz@redhat.com>, Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "open list:bochs" <qemu-block@nongnu.org>, Stefan Markovic <smarkovic@wavecomp.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard <anthony.perard@citrix.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, Andrzej Zaborowski <balrogg@gmail.com>, Thomas Huth <thuth@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTIvMTggMTE6MjIsIERhbmllbCBQLiBCZXJyYW5nw6kgd3JvdGU6Cj4+ICAgICBjcnlw
dG8vYWVzLmMKPj4gICAgIGNyeXB0by9kZXNyZmIuYwo+Cj4gSSdkIHJhdGhlciBsaWtlIHRoaXMg
dG8gYmUgY2xlYW5lZCB0byBmaW5pc2ggdGhlIGpvYiBmb3IKPiBjcnlwdG8vLgoKT2ssIHdpbGwg
ZG8uCgpQYW9sbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
