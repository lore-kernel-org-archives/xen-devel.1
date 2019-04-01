From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/4] pygrub/grub: always use integer for default
 entry
Date: Mon, 1 Apr 2019 11:32:36 +0100
Message-ID: <20190401103238.15649-3-wei.liu2@citrix.com>
References: <20190401103238.15649-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZqZs=SD=citrix.com=prvs=987e11b64=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hAuFM-0008Jr-B5
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 10:32:56 +0000
In-Reply-To: <20190401103238.15649-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, m.a.young@durham.ac.uk
List-Id: xen-devel@lists.xenproject.org

VGhlIG9yaWdpbmFsIGNvZGUgc2V0IHRoZSBkZWZhdWx0IHRvIGVpdGhlciBhIHN0cmluZyBvciBh
biBpbnRlZ2VyCigwKSBhbmQgcmVsaWVzIG9uIGEgUHl0aG9uIDIgc3BlY2lmaWMgYmVoYXZpb3Vy
IHRvIHdvcmsgKGludGVnZXIgaXMKYWxsb3dlZCB0byBiZSBjb21wYXJlZCB0byBzdHJpbmcgaW4g
UHl0aG9uIDIgYnV0IG5vdCAzKS4KCkFsd2F5cyB1c2UgaW50ZWdlci4gVGhlIGNhbGxlciAocHln
cnViKSBhbHJlYWR5IGhhcyBjb2RlIHRvIGhhbmRsZQp0aGF0LgoKUmVwb3J0ZWQtYnk6IE0gQSBZ
b3VuZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5IHwgNiAr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS90b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5IGIvdG9vbHMvcHlncnViL3Ny
Yy9HcnViQ29uZi5weQppbmRleCAwMjA0ZDQxMGFjLi41OTQxMzliYWM3IDEwMDY0NAotLS0gYS90
b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5CisrKyBiL3Rvb2xzL3B5Z3J1Yi9zcmMvR3J1YkNv
bmYucHkKQEAgLTIzMyw3ICsyMzMsMTEgQEAgY2xhc3MgX0dydWJDb25maWdGaWxlKG9iamVjdCk6
CiAgICAgICAgIGlmIHZhbCA9PSAic2F2ZWQiOgogICAgICAgICAgICAgc2VsZi5fZGVmYXVsdCA9
IDAKICAgICAgICAgZWxzZToKLSAgICAgICAgICAgIHNlbGYuX2RlZmF1bHQgPSB2YWwKKyAgICAg
ICAgICAgIHRyeToKKyAgICAgICAgICAgICAgICBzZWxmLl9kZWZhdWx0ID0gaW50KHZhbCkKKyAg
ICAgICAgICAgIGV4Y2VwdCBWYWx1ZUVycm9yOgorICAgICAgICAgICAgICAgIGxvZ2dpbmcud2Fy
bmluZygiSW52YWxpZCB2YWx1ZSAlcywgc2V0dGluZyBkZWZhdWx0IHRvIDAiICUodmFsLCkpCisg
ICAgICAgICAgICAgICAgc2VsZi5fZGVmYXVsdCA9IDAKIAogICAgICAgICBpZiBzZWxmLl9kZWZh
dWx0IDwgMDoKICAgICAgICAgICAgIHJhaXNlIFZhbHVlRXJyb3IoImRlZmF1bHQgbXVzdCBiZSBu
b24tbmVnYXRpdmUgbnVtYmVyIikKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
