From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 0/8] Coccinelle cleanups
Date: Thu, 05 Jul 2018 10:33:21 +0200
Message-ID: <87a7r6axpq.fsf__6572.10044232688$1530779526$gmane$org@dusky.pond.sub.org>
References: <20180704153919.12432-1-f4bug@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k+bg=jv=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1fazhe-0003A9-6I
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 08:33:26 +0000
In-Reply-To: <20180704153919.12432-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 4 Jul 2018 12:39:11
 -0300")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, "Michael S .
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>
List-Id: xen-devel@lists.xenproject.org

UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4gd3JpdGVzOgoKPiBOb3Ro
aW5nIGV4Y2l0aW5nIGhlcmUsIHBhdGNoZXMgY3JlYXRlZCBtZWNoYW5pY2FsbHkKPiAoY29tbW9u
IGFmdGVyIHNvZnQgZnJlZXplKS4KCkNjOiBxZW11LXRyaXZpYWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
