From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 7/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Tue, 17 Apr 2018 08:41:39 +0200
Message-ID: <12a7d9fc-2cff-821c-68c3-05d61c2640e2__34562.8015850254$1523947238$gmane$org@suse.com>
References: <1523920175-27287-1-git-send-email-maran.wilson@oracle.com>
 <1523920430-27952-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hi3k=hg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8KJD-0006sd-Tg
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 06:41:43 +0000
In-Reply-To: <1523920430-27952-1-git-send-email-maran.wilson@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, pbonzini@redhat.com
Cc: rkrcmar@redhat.com, mingo@redhat.com, hpa@zytor.com, boris.ostrovsky@oracle.com, tglx@linutronix.de, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMDE6MTMsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBGb3IgY2VydGFpbiBhcHBs
aWNhdGlvbnMgaXQgaXMgZGVzaXJhYmxlIHRvIHJhcGlkbHkgYm9vdCBhIEtWTSB2aXJ0dWFsCj4g
bWFjaGluZS4gSW4gY2FzZXMgd2hlcmUgbGVnYWN5IGhhcmR3YXJlIGFuZCBzb2Z0d2FyZSBzdXBw
b3J0IHdpdGhpbiB0aGUKPiBndWVzdCBpcyBub3QgbmVlZGVkLCBRZW11IHNob3VsZCBiZSBhYmxl
IHRvIGJvb3QgZGlyZWN0bHkgaW50byB0aGUKPiB1bmNvbXByZXNzZWQgTGludXgga2VybmVsIGJp
bmFyeSB3aXRob3V0IHRoZSBuZWVkIHRvIHJ1biBmaXJtd2FyZS4KPiAKPiBUaGVyZSBhbHJlYWR5
IGV4aXN0cyBhbiBBQkkgdG8gYWxsb3cgdGhpcyBmb3IgWGVuIFBWSCBndWVzdHMgYW5kIHRoZSBB
QkkKPiBpcyBzdXBwb3J0ZWQgYnkgTGludXggYW5kIEZyZWVCU0Q6Cj4gCj4gICAgaHR0cHM6Ly94
ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3B2aC5odG1sCj4gCj4gVGhpcyBwYXRj
aCBlbmFibGVzIFFlbXUgdG8gdXNlIHRoYXQgc2FtZSBlbnRyeSBwb2ludCBmb3IgYm9vdGluZyBL
Vk0KPiBndWVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyYW4gV2lsc29uIDxtYXJhbi53aWxz
b25Ab3JhY2xlLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9y
aXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gVGVzdGVkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KCllvdSBtaWdodCB3YW50IHRvIHNlbmQgYSBmb2xsb3ctdXAgcGF0Y2gg
dG8gcmVuYW1lIHRoZSBmdW5jdGlvbnMgaW4KYXJjaC94ODYvcGxhdGZvcm0vcHZoLyogZnJvbSB4
ZW5fKiB0byBwdmhfKi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
