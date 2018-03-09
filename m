From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v6.1 00/11] xen: xen-domid-restrict
	improvements
Date: Fri, 9 Mar 2018 16:20:36 +0000
Message-ID: <23202.46164.466502.645911@mariner.uk.xensource.com>
References: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdq1=f7=citrix.com=prvs=5995bc012=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1euKlB-0007fc-7c
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 16:20:45 +0000
In-Reply-To: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano  Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SSBoYXZlIGZvbGRlZCBpbiB0aGUgY29tbWVudHMgc28gZmFyIGFuZCBtYWRlIGEgcHJvdG90eXBl
IHY3IHNlcmllcywKd2hpY2ggaXMgaGVyZToKCiAgaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9cGVvcGxlL2l3ai9xZW11LmdpdDthPXN1bW1hcnkKICBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXQtaHR0cC9wZW9wbGUvaXdqL3FlbXUuZ2l0CiAgZ2l0Oi8veGVuYml0cy54ZW4ub3Jn
L3Blb3BsZS9pd2ovcWVtdS5naXQKCkluIHRoZSBicmFuY2gKCiAgbWFzdGVyLi54ZW4tcmVzdHJp
Y3QtdjcuMAoKSSBoYXZlIE5PVCBiZWVuIGFibGUgdG8gdGVzdCBpdCwgdW5mb3J0dW5hdGVseSwg
YXMgbXkgdGVzdCBzZXR1cCBmb3IKdGhpcyBoYWQgcm90dGVkIGFuZCBJIGFtIG5vdyBnb2luZyBh
d2F5IGZvciB0d28gd2Vla3MuICBJdCBkb2VzCmNvbXBpbGUuCgpJJ20gcG9zdGluZyB0aGlzIGhl
cmUganVzdCBiZWNhdXNlIGl0IHNlZW1zIGJhZCBmb3JtIHRvIGdvIGF3YXkgd2l0aAp0aGUgYnJh
bmNoIGluIGEgInNlY3JldCIgbG9jYXRpb24gb24gbXkgd29ya3N0YXRpb24uICBJZiBzb21lb25l
IGVsc2UKd2FudHMgdG8gcGljayBpdCB1cCBhbmQgc2hlcGhlcmQgaXQgaW50byB0aGUgMi4xMiBy
ZWxlYXNlIHRoZW4gdGhhdAp3b3VsZCBvZiBjb3Vyc2UgYmUgZmluZSBieSBtZTsgaWYgbm90IEkg
d2lsbCBwaWNrIGl0IHVwIHdoZW4gSSBnZXQKYmFjay4KCkkgaGF2ZSBzb21lIG1vcmUgd29yayB0
byBidWlsZCBvbiB0b3Agb2YgdGhpcyBhbnl3YXksIGluY2x1ZGluZyB3aXJpbmcKdGhpcyBpbnRv
IHRoZSBYZW4gQ0ksIGJlZm9yZSBpdCBjYW4gYmUgZGVjbGFyZWQgcHJvcGVybHkgc3VwcG9ydGVk
IGJ5Clhlbi4KCkluIHRoZSBtZWFudGltZSBtYXliZSB0aGUgZml4ZXMgdG8gZ2V0X21haW50YWlu
ZXIgYW5kIGNoZWNrcGF0Y2ggYXJlCmluZGVwZW5kZW50IG9mIHRoZSByZXN0IGFuZCBzaG91bGQg
cHJvYmFibHkgYmUgYXBwbGllZCBhcyBzb29uIGFzCnByYWN0aWNhbCAoc3ViamVjdCB0byBhbnkg
ZnVydGhlciByZXZpZXcgdGhhdCBtYXkgYmUgbmVlZGVkKS4gIHRoYXQKaXM6CgogW1BBVENIIDAx
LzEyXSBjaGVja3BhdGNoOiBBZGQgeGVuZGV2aWNlbW9kZWxfaGFuZGxlIHRvIHRoZSBsaXN0IG9m
IHR5cGVzCiBbUEFUQ0ggMTIvMTJdIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGw6IFByaW50IHBy
b3BlciBlcnJvciBtZXNzYWdlIGZvciBtaXNzaW5nICRmaWxlCgpPciBmcm9tIG15IGJyYW5jaCBh
Ym92ZSwKCiBjYjNlYmZmNDA4N2EgY2hlY2twYXRjaDogQWRkIHhlbmRldmljZW1vZGVsX2hhbmRs
ZSB0byB0aGUgbGlzdCBvZiB0eXBlcwogMTVkZWRjNjI3Y2FkIHNjcmlwdHMvZ2V0X21haW50YWlu
ZXIucGw6IFByaW50IHByb3BlciBlcnJvciBtZXNzYWdlIGZvciBtaXNzaW5nICRmaWxlCgpSZWdh
cmRzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
