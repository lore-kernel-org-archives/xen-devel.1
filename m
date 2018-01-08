From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] x86: xen: remove the use of VLAIS
Date: Mon, 8 Jan 2018 10:54:24 -0500
Message-ID: <37fc26d2-734a-4690-d4f2-6d0df82015a4__33815.2576158338$1515426836$gmane$org@oracle.com>
References: <c2217783-9d18-912f-8c13-996489dbe602@suse.com>
 <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fog3=ed=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eYZl3-0006Kk-Oc
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 15:54:41 +0000
In-Reply-To: <1515274788-24548-1-git-send-email-nick.desaulniers@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Nick Desaulniers <nick.desaulniers@gmail.com>, Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, ghackmann@google.com, mka@google.com, Ingo Molnar <mingo@redhat.com>, srhines@google.com, kees@google.com, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDYvMjAxOCAwNDozOSBQTSwgTmljayBEZXNhdWxuaWVycyB3cm90ZToKPiBWYXJpYWJs
ZSBMZW5ndGggQXJyYXlzIEluIFN0cnVjdHMgKFZMQUlTKSBpcyBub3Qgc3VwcG9ydGVkIGJ5IENs
YW5nLCBhbmQKPiBmcm93bmVkIHVwb24gYnkgb3RoZXJzLgo+Cj4gaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTMvOS8yMy81MDAKPgo+IEhlcmUsIHRoZSBWTEFJUyB3YXMgdXNlZCBiZWNhdXNlIHRo
ZSBzaXplIG9mIHRoZSBiaXRtYXAgcmV0dXJuZWQgZnJvbQo+IHhlbl9tY19lbnRyeSgpIGRlcGVu
ZGVkIG9uIHBvc3NpYmx5IChiYXNlZCBvbiBrZXJuZWwgY29uZmlndXJhdGlvbikKPiBydW50aW1l
IHNpemVkIGRhdGEuIFJhdGhlciB0aGFuIGRlY2xhcmluZyBhcmdzIGFzIGEgVkxBSVMgdGhlbiBj
YWxsaW5nCj4gc2l6ZW9mIG9uICphcmdzLCB3ZSBjYWxjdWxhdGUgdGhlIGFwcHJvcHJpYXRlIHNp
emVvZiBhcmdzIG1hbnVhbGx5Lgo+IEZ1cnRoZXIsIHdlIGNhbiBnZXQgcmlkIG9mIHRoZSAjaWZk
ZWYncyBhbmQgcmVseSBvbiBudW1fcG9zc2libGVfY3B1cygpCj4gKHRoYW5rcyB0byBhIGhlbHBm
dWwgY2hlY2twYXRjaCB3YXJuaW5nIGZyb20gYW4gZWFybGllciB2ZXJzaW9uIG9mIHRoaXMKPiBw
YXRjaCkuCj4KPiBTdWdnZXN0ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuaWNrLmRlc2F1bG5pZXJzQGdtYWls
LmNvbT4KCkFwcGxpZWQgdG8gZm9yLWxpbnVzLTQuMTUuCgotYm9yaXMKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
