From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v11 5/9] xen/x86: use DECLARE_BOUNDS as
 required
Date: Thu, 7 Mar 2019 14:43:39 +0000
Message-ID: <23681.11803.719165.841685@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-5-git-send-email-sstabellini@kernel.org>
 <5C7FEBBC020000780021C308@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1903061318160.17248@sstabellini-ThinkPad-X260>
 <5C80DB6A020000780021C58D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=21/k=RK=citrix.com=prvs=9622e5608=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1h1uGK-0005Om-41
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 14:44:44 +0000
In-Reply-To: <5C80DB6A020000780021C58D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCB2MTEgNS85XSB4ZW4veDg2OiB1c2UgREVD
TEFSRV9CT1VORFMgYXMgcmVxdWlyZWQiKToKPiBJJ2QgbGlrZSB0byBub3RlIHRob3VnaCB0aGF0
IGluIHRoZSBmaXJzdCB0d28gY2FzZXMgd2UgZG9uJ3QgYWx0ZXIgdGhlCj4gZGVjbGFyZWQgb2Jq
ZWN0IGFueXdheSwgYnV0IGluc3RlYWQgYSBkZXJpdmVkIG9uZTsgdGhlIGRlY2xhcmF0aW9uCj4g
c2hvdWxkIG5vdCB1c2UgY29uc3QgZm9yIG90aGVyIHJlYXNvbnMgdGhvdWdoLiBBbmQgdGhlIDNy
ZCBjYXNlIGlzCj4gZmlkZGxpbmcgd2l0aCBzb21ldGhpbmcgdGhhdCBoYXMgbG9zdCBpdHMgbWVh
bmluZyBhcyBhbiBvYmplY3QuIEluIGZhY3QKPiB3ZSdyZSBhYm91dCB0byBmcmVlIHRoZSB1bmRl
cmx5aW5nIG1lbW9yeS4gSW4gdGhpcyBjYXNlIEknZCBwcmVmZXIgdG8KPiByZXRhaW4gdGhlIGNv
bnN0LCBidXQgSSB3b24ndCBpbnNpc3QgYXMgdGhlIHN5bWJvbCBpcyBub24tY29uc3QgcmlnaHQK
PiBub3cgYXMgd2VsbC4KCkkgdGhpbmsgaWYgeW91IGRvIHRoaXMKCiAgZXh0ZXJuIGNvbnN0IHN0
cnVjdCBibGFoIGJsYWhfc3RhcnRbXTsKCml0IGlzIG5vdCBzYWZlIHRvIGNhc3QgdGhlIGNvbnN0
IGF3YXkgbGF0ZXIuCgpGcm9tIEM5OStUQzErVEMyLCA2LjcuMyA1OgoKICA1ICBJZiBhbiBhdHRl
bXB0IGlzIG1hZGUgdG8gbW9kaWZ5IGFuIG9iamVjdCBkZWZuZWQgd2l0aCBhCiAgICAgY29uc3Qt
cXVhbGlmZWQgdHlwZSB0aHJvdWdoIHVzZSBvZiBhbiBsdmFsdWUgd2l0aAogICAgIG5vbi1jb25z
dC1xdWFsaWZlZCB0eXBlLCB0aGUgYmVoYXZpb3IgaXMgdW5kZWZuZWQuIC4uLgoKT2YgY291cnNl
IGBleHRlcm4gY29uc3Qgc3RydWN0IGJsYWggYmxhaF9zdGFydFtdJyBpcyBvbmx5IGEKZGVjbGFy
YXRpb24sIG5vdCBhIGRlZmluaXRpb24uCgpCdXQgYWxsIHRoZSBkZWNsYXJhdGlvbnMvZGVmaW5p
dGlvbnMgZXZlbiBpbiBkaWZmZXJlbnQgdHJhbnNsYXRpb24KdW5pdHMgbXVzdCBiZSBgY29tcGF0
aWJsZScgKG9yIFVCLCA2LjIuNyAyKSBhbmQgZm9yIHR5cGVzIHRvIGJlCmBjb21wYXRpYmxlJyB0
aGV5IG11c3QgYmUgaWRlbnRpY2FsbHkgcXVhbGlmaWVkICg2LjcuMyA5KS4KClNvIHRoZSBjb21w
aWxlciBhdXRob3JzIHdpbGwgc2F5IHRoYXQKCiAgYGV4dGVybiBjb25zdCBzdHJ1Y3QgYmxhaCBi
bGFoX3N0YXJ0W10nCgppbXBsaWVzIGEgZGVmaW5pdGlvbiBzb21ld2hlcmUgb2YgYW4gYXJyYXkg
CgogIGBleHRlcm4gY29uc3Qgc3RydWN0IGJsYWggYmxhaF9zdGFydFsgc29tZXNpemUgXQoKYW5k
IHRoZXJlZm9yZSBhbnkgYWNjZXNzZXMgYHRvIGJsYWhfc3RhcnQnICh3aGljaCBpbiB0aGVpciBt
aW5kIG1lYW5zCmFueSBhY2Nlc3NlcyB2aWEgYSBwb2ludGVyIHdob3NlIHByb3ZlbmFuY2UgaXMg
YmxhaF9zdGFydCkgdmlhCm5vbi1jb25zdCBsdmFsdWVzIChldmVuIGZvciByZWFkaW5nISkgaXMg
VUIuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
