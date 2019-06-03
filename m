From: Julien Grall <julien.grall@arm.com>
Subject: Re: [xen/arm]: Mapping physical memory to dom0/domU
Date: Mon, 3 Jun 2019 16:16:59 +0100
Message-ID: <42ab65d9-9543-2187-ce61-9dd6f490a8a5@arm.com>
References: <5135f598-556c-cdd4-f9b1-2ce83f49b5d9@ice.rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXohq-0004q6-Fz
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 15:17:02 +0000
In-Reply-To: <5135f598-556c-cdd4-f9b1-2ce83f49b5d9@ice.rwth-aachen.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@ice.rwth-aachen.de>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOS8wNS8yMDE5IDE1OjA2LCBMdWthcyBKw7xuZ2VyIHdyb3RlOgo+IEhpIGFsbCwKCkhp
LAoKPiBJcyB0aGVyZSBhIHdheSB0byBtYXAgYSByZWdpb24gb2YgcGh5c2ljYWwgbWVtb3J5IHRv
IGRvbTAvZG9tVT8KClllcywgeW91IGNhbiB1c2UgdGhlIG9wdGlvbiAnaW9tZW0nLgoKPiBMZXQn
cyBzYXkgSSBoYXZlIGEgY3VzdG9tIGRldmljZSBtYXBwZWQgYXQgdGhhdCBtZW1vcnkgcmVnaW9u
IGFuZCBJIHdhbnQgZWl0aGVyIAo+IGRvbTAgb3IgYSBkb21VIHRvIGhhdmUgZnVsbCBhY2Nlc3Mg
dG8gdGhpcyBkZXZpY2UuCgpUaGUgcGFnZSBbMV0gd2lsbCBnaXZlIHlvdSBpbnN0cnVjdGlvbiBo
b3cgdG8gcGFzc3Rocm91Z2ggYSBkZXZpY2UuCgo+IFRoZXJlIHNlZW1zIHRvIGJlIGEgd2F5IHRv
IHNoYXJlIG1lbW9yeSBiZXR3ZWVuIGRvbTAgYW5kIGEgZG9tVSwgbWF5YmUgYWxzbyAKPiBiZXR3
ZWVuIGRvbVUgYW5kIGRvbVUuCgpUaGlzIGNhbiBiZSBkb25lIGR5bmFtaWNhbGx5IHVzaW5nIGdy
YW50LXRhYmxlLiBUaGVyZSBhcmUgcGF0Y2hlcyBvbiB0aGUgTUwgZm9yIApzdGF0aWMgc2hhcmlu
Zy4KCkNoZWVycywKCj4gCj4gVGhhbmtzLAo+IEx1a2FzCgpbMV0gaHR0cHM6Ly94ZW5iaXRzLnhl
bi5vcmcvZG9jcy91bnN0YWJsZS9taXNjL2FybS9wYXNzdGhyb3VnaC50eHQKCj4gCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAo+IAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
