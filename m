From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 10/25] usb-redir: Verify
 usbredirparser_write get called with positive count
Date: Wed, 20 Feb 2019 08:32:56 +0100
Message-ID: <20190220073253.gtjfejyrozbp32cc@sirius.home.kraxel.org>
References: <20190220010232.18731-1-philmd@redhat.com>
 <20190220010232.18731-11-philmd@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hWxu=Q3=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1gwMO4-00027q-WA
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 07:33:49 +0000
Content-Disposition: inline
In-Reply-To: <20190220010232.18731-11-philmd@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, qemu-s390x@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Prasad J Pandit <pjp@fedoraproject.org>, Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDI6MDI6MTdBTSArMDEwMCwgUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgd3JvdGU6Cj4gVGhlIHVzYnJlZGlycGFyc2VyX3dyaXRlIGhhbmRsZXIgc2hvdWxk
IG5ldmVyIGJlIGNhbGxlZCB3aXRoIGEgbmVnYXRpdmUKPiBzaXplIHBheWxvYWQsIHJldHVybiBh
biBlcnJvciBpZiB0aGlzIGlzIG5vdCB0aGUgY2FzZS4KPiBOb3cgdGhhdCB3ZSBhcmUgc3VyZSB0
aGUgJ2NvdW50JyB2YWx1ZSBpcyBwb3NpdGl2ZSwgbWFrZSBpdCBvYnZpb3VzIGJ5Cj4gY2FzdGlu
ZyBpdCB0byBhIHNpemVfdC4KClJldmlld2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
