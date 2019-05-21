From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 16/50] x86emul: support AVX512F move
 duplicate insns
Date: Tue, 21 May 2019 12:09:48 +0100
Message-ID: <889e2a61-efc3-5cbe-e8f6-dfd07832b61b@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8241020000780021F1BE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u0k=TV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hT2eZ-0000WB-P4
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 11:09:55 +0000
In-Reply-To: <5C8B8241020000780021F1BE@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSnVkZ2luZyBmcm9tIGlu
c24gcHJlZml4ZXMsIHRoZXNlIGFyZSBzY2FsYXIgaW5zbnMsIGJ1dCB0aGVpciAobWVtb3J5KQo+
IG9wZXJhbmRzIGFyZSB2ZWN0b3Igb25lcyAod2l0aCB0aGUgZXhjZXB0aW9uIG9mIDEyOC1iaXQg
Vk1PVkREVVApLiBGb3IKPiB0aGlzIHNvbWUgYWRqdXN0bWVudHMgdG8gZGlzcDhzY2FsZSBjYWxj
dWxhdGlvbiBjb2RlIGFyZSBuZWVkZWQuCj4KPiBObyBleHBsaWNpdCB0ZXN0IGhhcm5lc3MgYWRk
aXRpb25zIG90aGVyIHRoYW4gdGhlIG92ZXJyaWRlcywgYXMgdGhlCj4gY29tcGlsZXIgYWxyZWFk
eSBtYWtlcyB1c2Ugb2YgdGhlIGluc25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
