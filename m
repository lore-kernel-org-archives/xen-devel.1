From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 2/2] xenpmd: make 32 bit gcc 8.1 non-debug
 build work
Date: Mon, 20 Aug 2018 11:24:18 +0100
Message-ID: <23418.38610.506191.875422@mariner.uk.xensource.com>
References: <20180726145854.10978-1-wei.liu2@citrix.com>
 <20180726145854.10978-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=egrx=ld=citrix.com=prvs=763ac145b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1frhMV-0000vW-5v
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 10:24:39 +0000
In-Reply-To: <20180726145854.10978-3-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0ggMi8yXSB4ZW5wbWQ6IG1ha2UgMzIgYml0IGdjYyA4LjEg
bm9uLWRlYnVnIGJ1aWxkIHdvcmsiKToKPiAzMiBiaXQgZ2NjIDguMSBub24tZGVidWcgYnVpbGQg
eWllbGRzOgouLi4KPiAgICAgIC8qIHdyaXRlIDkgZHdvcmRzIChzbyA5KjQpICsgbGVuZ3RoIG9m
IDQgc3RyaW5ncyArIDQgbnVsbCB0ZXJtaW5hdG9ycyAqLwo+IC0gICAgc25wcmludGYodmFsLCAz
LCAiJTAyeCIsIAo+IC0gICAgICAgICAgICAgKHVuc2lnbmVkIGludCkoOSo0ICsKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cmxlbihpbmZvLT5tb2RlbF9udW1iZXIpICsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmxlbihpbmZvLT5zZXJpYWxfbnVtYmVyKSArCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJsZW4oaW5mby0+YmF0dGVyeV90eXBlKSAr
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJsZW4oaW5mby0+b2VtX2luZm8pICsg
NCkpOwoKVGhpcyBpcyBwcmV0dHkgdW5wbGVhc2FudCEKCj4gKyAgICBsZW4gPSA5ICogNCArIHN0
cmxlbihpbmZvLT5tb2RlbF9udW1iZXIpICsgc3RybGVuKGluZm8tPnNlcmlhbF9udW1iZXIpICsK
PiArICAgICAgICAgIHN0cmxlbihpbmZvLT5iYXR0ZXJ5X3R5cGUpICsgc3RybGVuKGluZm8tPm9l
bV9pbmZvKSArIDQ7Cj4gKyAgICBhc3NlcnQobGVuIDwgMjU1KTsKPiArICAgIHNucHJpbnRmKHZh
bCwgMywgIiUwMngiLCBsZW4pOwoKVGhpcyBpcyBzbGlnaHRseSBsZXNzIHVucGxlYXNhbnQsIEkg
Z3Vlc3MuLi4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
