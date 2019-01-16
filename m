From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH v2] xen: Fix x86 sched_clock() interface for
 xen
Date: Wed, 16 Jan 2019 13:35:47 +0000
Message-ID: <20190116133547.E246820859@mail.kernel.org>
References: <20190111120805.24852-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LCoz=PY=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1gjlMD-0005P6-OO
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:35:49 +0000
In-Reply-To: <20190111120805.24852-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, stable@vger.kernel.org, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoiIHRhZywKZml4aW5nIGNvbW1p
dDogZjk0YzhkMTE2OTk3IHNjaGVkL2Nsb2NrLCB4ODYvdHNjOiBSZXdvcmsgdGhlIHg4NiAndW5z
dGFibGUnIHNjaGVkX2Nsb2NrKCkgaW50ZXJmYWNlLgoKVGhlIGJvdCBoYXMgdGVzdGVkIHRoZSBm
b2xsb3dpbmcgdHJlZXM6IHY0LjIwLjIsIHY0LjE5LjE1LCB2NC4xNC45My4KCnY0LjIwLjI6IEJ1
aWxkIE9LIQp2NC4xOS4xNTogQnVpbGQgT0shCnY0LjE0LjkzOiBGYWlsZWQgdG8gYXBwbHkhIFBv
c3NpYmxlIGRlcGVuZGVuY2llczoKICAgIDIyMjlmNzBiNWJiYiAoIng4Ni94ZW4vdGltZTogc2V0
dXAgdmNwdSAwIHRpbWUgaW5mbyBwYWdlIikKICAgIGI4ODg4MDgwOTMxMSAoIng4Ni94ZW4vdGlt
ZTogc2V0IHB2Y2xvY2sgZmxhZ3Mgb24geGVuX3RpbWVfaW5pdCgpIikKCgpIb3cgc2hvdWxkIHdl
IHByb2NlZWQgd2l0aCB0aGlzIHBhdGNoPwoKLS0KVGhhbmtzLApTYXNoYQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
