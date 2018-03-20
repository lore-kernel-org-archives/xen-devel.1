From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu: include generated files
 with <> and not ""
Date: Tue, 20 Mar 2018 17:36:53 +0000
Message-ID: <20180320173653.GH4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iii=gk=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1eyLCD-0008OZ-S1
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 17:37:13 +0000
Content-Disposition: inline
In-Reply-To: <b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefan Weil <sw@weilnetz.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>, Eduardo Habkost <ehabkost@redhat.com>, Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhangha>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDU6MzM6NDJQTSArMDEwMCwgU3RlZmFuIFdlaWwgd3Jv
dGU6Cj4gCj4gVmVyeSBsYXJnZSBwcm9qZWN0cyBvZnRlbiBzcGxpdCBpbiBzdWIgcHJvamVjdHMs
IG1heWJlIG9uZSBvZiB0aGVtCj4gZGVzY3JpYmluZyB0aGUgQVBJLiBUaGVuIHRoYXQgQVBJIGhl
YWRlcnMgYXJlIHNpbWlsYXIgdG8gc3lzdGVtIGhlYWRlcnMKPiBhbmQgY2FuIGJlIGluY2x1ZGVk
IHVzaW5nIDw+LCBhbHRob3VnaCB0aGV5IHN0aWxsIGJlbG9uZyB0byB0aGUgc2FtZQo+IGxhcmdl
ciBwcm9qZWN0LiBEbyB3ZSBoYXZlIGEgc3RhYmxlIFFFTVUgQVBJIGRlc2NyaWJlZCBpbiBhIChz
bWFsbCkKPiBudW1iZXIgb2YgaW5jbHVkZSBmaWxlcyB3aGljaCB0eXBpY2FsbHkgZG8gbm90IGNo
YW5nZT8gSWYgeWVzLCB0aGVuCj4gdGhvc2UgaW5jbHVkZSBmaWxlcyBjb3VsZCBiZSBpbmNsdWRl
ZCB1c2luZyA8PiBiZWNhdXNlIHdlIGRvbid0IG5lZWQKPiB0aGVtIGluIGRlcGVuZGVuY3kgbGlz
dHMgb3IgaW4gc3RhdGljIGNvZGUgYW5hbHlzaXMgcmVwb3J0cy4KClFFTVUgZG9lc24ndCBoYXZl
IGFueXRoaW5nIHdlJ2QgY2FsbCBhIHN0YWJsZSBBUEkgYXQgdGhlIHNvdXJjZSBsZXZlbCwKYW55
dGhpbmcgaXMgc3ViamVjdCB0byBjaGFuZ2UgYXQgYW55IHRpbWUsIGFuZCBvZnRlbiBkb2VzLgoK
UmVnYXJkcywKRGFuaWVsCi0tIAp8OiBodHRwczovL2JlcnJhbmdlLmNvbSAgICAgIC1vLSAgICBo
dHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFuZ2UgOnwKfDogaHR0cHM6Ly9saWJ2
aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBzOi8vZnN0b3AxMzguYmVycmFuZ2Uu
Y29tIDp8Cnw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3
dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
