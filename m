From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 0/8] libvchan: Minor improvements
Date: Fri, 2 Nov 2018 17:01:05 +0000
Message-ID: <20181102170113.11646-1-ian.jackson@eu.citrix.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vtjf=nn=citrix.com=prvs=837fd0aa5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIcpY-0004Zm-Vq
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 17:01:57 +0000
In-Reply-To: <23516.33005.649128.145551@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

TW9zdGx5IGludGVybmFsIHRpZHlpbmcsIGJ1dCBhbHNvIGFuIEFQSSBwcm9taXNlIGFib3V0IHdo
YXQgRU5PRU5UCm1lYW5zIGZyb20gbGlieGVudmNoYW5fY2xpZW50X2luaXQuCgpJYW4gSmFja3Nv
biAoOCk6CiAgdG9vbHMvbGlidmNoYW46IEluaXRpYWxpc2UgeHNfdHJhbnNhY3Rpb25fdCB0byBY
QlRfTlVMTCwgbm90IE5VTEwKICB0b29scy94ZW5zdG9yZTogRG9jdW1lbnQgdGhhdCB4c19jbG9z
ZSgwKSBpcyBPSy4KICB0b29scy9saWJ2Y2hhbjogaW5pdF94c19zcnY6IFNpbXBsaWZ5IGVycm9y
IGhhbmRsaW5nICgxKQogIHRvb2xzL2xpYnZjaGFuOiBpbml0X3hzX3NydjogU2ltcGxpZnkgZXJy
b3IgaGFuZGxpbmcgKDIpCiAgdG9vbHMvbGlidmNoYW46IGluaXRfeHNfc3J2OiBUdXJuIHhzIHJl
dHJ5IGZyb20gZ290byBpbnRvIGZvciAoOzspCiAgdG9vbHMvbGlidmNoYW46IEFkZCB4ZW50b29s
bG9nIHRvIGRpcmVjdCBkZXBlbmRlbmNpZXMKICB0b29scy9saWJ2Y2hhbjogbGlieGVudmNoYW5f
Kl9pbml0OiBQcm9taXNlIGFuIGVycm5vCiAgdG9vbHMvbGlidmNoYW46IGxpYnhlbnZjaGFuX2Ns
aWVudF9pbml0OiB1c2UgRU5PRU5UIGZvciBubyBzZXJ2ZXIKCiB0b29scy9saWJ2Y2hhbi9NYWtl
ZmlsZSAgICAgICAgICAgfCAgNiArKy0tCiB0b29scy9saWJ2Y2hhbi9pbml0LmMgICAgICAgICAg
ICAgfCA3MiArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIHRvb2xzL2xp
YnZjaGFuL2xpYnhlbnZjaGFuLmggICAgICB8ICA4ICsrKy0tCiB0b29scy9saWJ2Y2hhbi94ZW52
Y2hhbi5wYy5pbiAgICAgfCAgMiArLQogdG9vbHMveGVuc3RvcmUvaW5jbHVkZS94ZW5zdG9yZS5o
IHwgIDIgKy0KIDUgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25z
KC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
