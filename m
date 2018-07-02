From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v4 8/9] xen/gntdev: Implement dma-buf export
 functionality
Date: Mon, 2 Jul 2018 10:04:13 +0300
Message-ID: <31fdf7cc-6c57-6216-06b6-54471d873178__41833.0299006358$1530514989$gmane$org@gmail.com>
References: <20180615062753.9229-1-andr2000@gmail.com>
 <20180615062753.9229-9-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3knd=js=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1fZssk-00048E-5P
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 07:04:18 +0000
Received: by mail-lj1-x242.google.com with SMTP id a6-v6so11699294ljj.7
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jul 2018 00:04:16 -0700 (PDT)
In-Reply-To: <20180615062753.9229-9-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Cc: daniel.vetter@intel.com, matthew.d.roper@intel.com, dongwon.kim@intel.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

Kwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIGRtYWJ1Zl9leHBfb3BzID0gIHsK
PiArCS5hdHRhY2ggPSBkbWFidWZfZXhwX29wc19hdHRhY2gsCj4gKwkuZGV0YWNoID0gZG1hYnVm
X2V4cF9vcHNfZGV0YWNoLAo+ICsJLm1hcF9kbWFfYnVmID0gZG1hYnVmX2V4cF9vcHNfbWFwX2Rt
YV9idWYsCj4gKwkudW5tYXBfZG1hX2J1ZiA9IGRtYWJ1Zl9leHBfb3BzX3VubWFwX2RtYV9idWYs
Cj4gKwkucmVsZWFzZSA9IGRtYWJ1Zl9leHBfb3BzX3JlbGVhc2UsCj4gKwkubWFwID0gZG1hYnVm
X2V4cF9vcHNfa21hcCwKPiArCS5tYXBfYXRvbWljID0gZG1hYnVmX2V4cF9vcHNfa21hcF9hdG9t
aWMsCj4gKwkudW5tYXAgPSBkbWFidWZfZXhwX29wc19rdW5tYXAsCj4gKwkudW5tYXBfYXRvbWlj
ID0gZG1hYnVmX2V4cF9vcHNfa3VubWFwX2F0b21pYywKPiArCS5tbWFwID0gZG1hYnVmX2V4cF9v
cHNfbW1hcCwKPiArfTsKPiArCj4KRHVlIHRvIHVwY29taW5nIEFQSSBjaGFuZ2UgWzFdIHRoZSBh
dG9taWMgb3BzIG5lZWQgdG8gYmUgcmVtb3ZlZCBiZWZvcmUKbWVyZ2luZyBpbnRvIHRoZSBtYWlu
bGluZQoKWzFdIApodHRwczovL2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYy9jb21t
aXQvaW5jbHVkZS9saW51eC9kbWEtYnVmLmg/aWQ9ZjY2NGE1MjY5NTQyOWI2OGFmYjRlMTMwYTBm
NjljZDVmZDFmZWM4NgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
