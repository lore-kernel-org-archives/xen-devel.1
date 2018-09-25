From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] x86/hvm: Add check for
 cpu_has_vmx_virt_exceptions
Date: Tue, 25 Sep 2018 10:20:42 +0100
Message-ID: <814f1f25-2a3f-a367-b496-f8d6a7374a68@citrix.com>
References: <20180925091038.4553-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gmpq=mh=citrix.com=prvs=79922396b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g4jWR-0000J6-My
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 09:20:47 +0000
In-Reply-To: <20180925091038.4553-1-aisaila@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDkvMTggMTA6MTAsIEFsZXhhbmRydSBJc2FpbGEgd3JvdGU6Cj4gVGhpcyBpcyB1c2Vm
dWwgc28gSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25vdGlmeSB3aWxsIGZhaWwgYW5kIG5vdAo+
IHNpbGVudGx5IHN1Y2NlZWQuIEl0IHNhdmUgYSBjYWxsIHRvIEhWTU9QX2FsdHAybV9zZXRfc3Vw
cHJlc3NfdmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJp
dGRlZmVuZGVyLmNvbT4KCkluIHByaW5jaXBsZSB3ZSBjb3VsZCBlbXVsYXRlIHRoaXMgYnkgaGF2
aW5nIC5zdmUgYmVjb21pbmcgYW4KRVBUX01JU0NPTkZJRywgYnV0IHRoYXQgY2FuIGJlIGxlZnQg
dG8gd2hvbWV2ZXIgd2FudHMgdG8gdXNlIHRoaXMKZnVuY3Rpb25hbGl0eSBvbiBwcmUtQnJvYWR3
ZWxsIGhhcmR3YXJlLgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
