From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-netfront: Fix hang on device removal
Date: Wed, 28 Feb 2018 20:21:30 +0100
Message-ID: <d6411bf3-9edd-15a7-1f4e-a9f51869129d__15794.3409555175$1519845624$gmane$org@suse.com>
References: <20180228122323.3914-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=j4wv=fw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1er7IJ-0006ym-AR
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 19:21:39 +0000
In-Reply-To: <20180228122323.3914-1-jandryuk@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: Eduardo Otubo <otubo@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTM6MjMsIEphc29uIEFuZHJ5dWsgd3JvdGU6Cj4gQSB0b29sc3RhY2sgbWF5
IGRlbGV0ZSB0aGUgdmlmIGZyb250ZW5kIGFuZCBiYWNrZW5kIHhlbnN0b3JlIGVudHJpZXMKPiB3
aGlsZSB4ZW4tbmV0ZnJvbnQgaXMgaW4gdGhlIHJlbW92YWwgY29kZSBwYXRoLiAgSW4gdGhhdCBj
YXNlLCB0aGUKPiBjaGVja3MgZm9yIHhlbmJ1c19yZWFkX2RyaXZlcl9zdGF0ZSB3b3VsZCByZXR1
cm4gWGVuYnVzU3RhdGVVbmtub3duLCBhbmQKPiB4ZW5uZXRfcmVtb3ZlIHdvdWxkIGhhbmcgaW5k
ZWZpbml0ZWx5LiAgVGhpcyBoYW5nIHByZXZlbnRzIHN5c3RlbQo+IHNodXRkb3duLgo+IAo+IHhl
bm5ldF9yZW1vdmUgbXVzdCBiZSBhYmxlIHRvIGhhbmRsZSBYZW5idXNTdGF0ZVVua25vd24sIGFu
ZAo+IG5ldGJhY2tfY2hhbmdlZCBtdXN0IGFsc28gd2FrZSB1cCB0aGUgd2FrZV9xdWV1ZSBmb3Ig
dGhhdCBzdGF0ZSBhcyB3ZWxsLgo+IAo+IEZpeGVzOiA1YjU5NzFkZjNiYzIgKCJ4ZW4tbmV0ZnJv
bnQ6IHJlbW92ZSB3YXJuaW5nIHdoZW4gdW5sb2FkaW5nIG1vZHVsZSIpCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPgo+IENjOiBFZHVhcmRvIE90
dWJvIDxvdHVib0ByZWRoYXQuY29tPgoKQ29tbWl0dGVkIHRvIHhlbi90aXAgZm9yLWxpbnVzLTQu
MTZhCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
