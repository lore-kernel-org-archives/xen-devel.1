From: Jan Ruh <jan.ruh@tttech.com>
Subject: Hypervisor Debugging GDB, KDB
Date: Thu, 14 Mar 2019 09:18:04 +0000
Message-ID: <697438d7d03c4ff3b0cd9505d8be67d1@TTTEX01.ds1.internal>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zzeG=RR=tttech.com=prvs=9698f6863=jan.ruh@srs-us1.protection.inumbo.net>)
 id 1h4MV7-0005H2-2R
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 09:18:09 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

RGVhciBYZW4gRGV2ZWxvcGVyIG1haWxpbmcgbGlzdCwKCkkgaGF2ZSBiZWVuIGxvb2tpbmcgZm9y
IGRldGFpbGVkIEluZm9ybWF0aW9uIGFib3V0IHRoZSBjdXJyZW50IHN0YXR1cyBvZiBYZW4gaHlw
ZXJ2aXNvciBkZWJ1Z2dpbmcuIEkgY2hlY2tlZCB0aGUgbWFpbGluZyBsaXN0IChxdWVzdGlvbnMg
bW9zdGx5IHVuYW5zd2VyZWQgb3Igb3V0ZGF0ZWQpLCB0aGUgcmVwb3NpdG9yaWVzLCBhbmQgc2V2
ZXJhbCBzZWFyY2ggZW5naW5lIHdpdGhvdXQgYSBzYXRpc2Z5aW5nIGFuc3dlciB0byBteSBxdWVz
dGlvbi4gSXMgdGhlcmUgYW55IHdheSBvZiBzaW5nbGUgc3RlcHBpbmcgWGVuIGh5cGVydmlzb3Ig
YXMgd2UgdXN1YWxseSBkbywgZS5nLiwgd2l0aCB0aGUgTGludXgga2VybmVsIHVzaW5nIGdkYiBh
bmQga2RiIG92ZXIgc2VyaWFsIHBvcnQ/IElmIHNvIGNhbiB5b3UgZ2l2ZSBtZSBhIGhpbnQgd2hl
cmUgdG8gZmluZCB0aGlzIGluZm9ybWF0aW9uLCBmdXJ0aGVybW9yZSBpdCBtaWdodCBiZSBnb29k
IHRvIG1ha2UgdGhpcyBpbmZvcm1hdGlvbiBlYXNpbHkgYWNjZXNzaWJsZSBmb3IgbmV3Y29tZXJz
IGluIFhlbiBkZXZlbG9wbWVudC4KCkJlc3QsCgpKYW4gUnVoCkNPTkZJREVOVElBTElUWTogVGhl
IGNvbnRlbnRzIG9mIHRoaXMgZS1tYWlsIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIG9u
bHkgZm9yIHRoZSBhYm92ZSBhZGRyZXNzZWUocykuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRl
ZCByZWNpcGllbnQsIG9yIHRoZSBwZXJzb24gcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJpbmcgaXQg
dG8gdGhlIGludGVuZGVkIHJlY2lwaWVudCwgY29weWluZyBvciBkZWxpdmVyaW5nIGl0IHRvIGFu
eW9uZSBlbHNlIG9yIHVzaW5nIGl0IGluIGFueSB1bmF1dGhvcml6ZWQgbWFubmVyIGlzIHByb2hp
Yml0ZWQgYW5kIG1heSBiZSB1bmxhd2Z1bC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlLW1haWwgYnkg
bWlzdGFrZSwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGFuZCB0aGUgc3lzdGVtcyBhZG1pbmlz
dHJhdG9yIGF0IHN0cmF5bWFpbEB0dHRlY2guY29tIGltbWVkaWF0ZWx5LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
