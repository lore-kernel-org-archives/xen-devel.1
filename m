From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86/hvm/ioreq: MMIO range checking
 completely ignores direction flag
Date: Fri, 10 Aug 2018 12:11:32 +0100
Message-ID: <e4e3d79b-6aa0-20f8-51c7-e78738230146@citrix.com>
References: <20180810103714.5112-1-paul.durrant@citrix.com>
 <20180810103714.5112-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0occ=kz=citrix.com=prvs=753c25753=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fo5KR-0003i8-HG
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 11:11:35 +0000
In-Reply-To: <20180810103714.5112-2-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDgvMTggMTE6MzcsIFBhdWwgRHVycmFudCB3cm90ZToKPiBodm1fc2VsZWN0X2lvcmVx
X3NlcnZlcigpIGlzIHVzZWQgdG8gcm91dGUgYW4gaW9yZXEgdG8gdGhlIGFwcHJvcHJpYXRlCj4g
aW9yZXEgc2VydmVyLiBGb3IgTU1JTyB0aGlzIGlzIGRvbmUgYnkgY29tcGFyaW5nIHRoZSByYW5n
ZSBvZiB0aGUgaW9yZXEKPiB0byB0aGUgcmFuZ2VzIHJlZ2lzdGVyZWQgYnkgdGhlIGRldmljZSBt
b2RlbHMgb2YgZWFjaCBpb3JlcSBzZXJ2ZXIuCj4gVW5mb3J0dW5hdGVseSB0aGUgY2FsY3VsYXRp
b24gb2YgdGhlIHJhbmdlIGlmIHRoZSBpb3JlcSBjb21wbGV0ZWx5IGlnbm9yZXMKPiB0aGUgZGly
ZWN0aW9uIGZsYWcgYW5kIHRodXMgbWF5IGNhbGN1bGF0ZSB0aGUgd3JvbmcgcmFuZ2UgZm9yIGNv
bXBhcmlzb24uCj4gVGh1cyB0aGUgaW9yZXEgbWF5IGVpdGhlciBiZSByb3V0ZWQgdG8gdGhlIHdy
b25nIHNlcnZlciBvciBlcnJvbmVvdXNseQo+IHRlcm1pbmF0ZWQgYnkgbnVsbF9vcHMuCj4KPiBO
T1RFOiBUaGUgcGF0Y2ggYWxzbyBmaXhlcyB3aGl0ZXNwYWNlIGluIHRoZSBzd2l0Y2ggc3RhdGVt
ZW50IHRvIG1ha2UgaXQKPiAgICAgICBzdHlsZSBjb21wbGlhbnQuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
