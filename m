From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH] [v3] x86: Convert x86_platform_ops to
 timespec64
Date: Fri, 27 Apr 2018 23:21:29 +0100
Message-ID: <b8d3167b-ee9f-f14d-e43e-73aa2719d6ae__24813.1830980585$1524867655$gmane$org@oracle.com>
References: <20180427201435.3194219-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nfc6=hq=oracle.com=joao.m.martins@srs-us1.protection.inumbo.net>)
 id 1fCBkf-0005gC-EV
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 22:22:01 +0000
In-Reply-To: <20180427201435.3194219-1-arnd@arndb.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Juergen Gross <jgross@suse.com>, jailhouse-dev@googlegroups.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, y2038@lists.linaro.org, Jan Kiszka <jan.kiszka@siemens.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, John Stultz <john.stultz@linaro.org>, Borislav Petkov <bp@suse.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjcvMjAxOCAwOToxMyBQTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva2VybmVsL3B2Y2xvY2suYyBiL2FyY2gveDg2L2tlcm5lbC9wdmNsb2NrLmMK
PiBpbmRleCA3NjFmNmFmNmVmYTUuLjYzNzk4MmVmZWNkOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4
Ni9rZXJuZWwvcHZjbG9jay5jCj4gKysrIGIvYXJjaC94ODYva2VybmVsL3B2Y2xvY2suYwo+IEBA
IC0xMjMsMjggKzEyMywzNSBAQCB1NjQgcHZjbG9ja19jbG9ja3NvdXJjZV9yZWFkKHN0cnVjdCBw
dmNsb2NrX3ZjcHVfdGltZV9pbmZvICpzcmMpCj4gIAo+ICB2b2lkIHB2Y2xvY2tfcmVhZF93YWxs
Y2xvY2soc3RydWN0IHB2Y2xvY2tfd2FsbF9jbG9jayAqd2FsbF9jbG9jaywKPiAgCQkJICAgIHN0
cnVjdCBwdmNsb2NrX3ZjcHVfdGltZV9pbmZvICp2Y3B1X3RpbWUsCj4gLQkJCSAgICBzdHJ1Y3Qg
dGltZXNwZWMgKnRzKQo+ICsJCQkgICAgc3RydWN0IHRpbWVzcGVjNjQgKnRzKQo+ICB7Cj4gIAl1
MzIgdmVyc2lvbjsKPiAgCXU2NCBkZWx0YTsKPiAtCXN0cnVjdCB0aW1lc3BlYyBub3c7Cj4gKwlz
dHJ1Y3QgdGltZXNwZWM2NCBub3c7Cj4gIAo+ICAJLyogZ2V0IHdhbGxjbG9jayBhdCBzeXN0ZW0g
Ym9vdCAqLwo+ICAJZG8gewo+ICAJCXZlcnNpb24gPSB3YWxsX2Nsb2NrLT52ZXJzaW9uOwo+ICAJ
CXJtYigpOwkJLyogZmV0Y2ggdmVyc2lvbiBiZWZvcmUgdGltZSAqLwo+ICsJCS8qCj4gKwkJICog
Tm90ZTogd2FsbF9jbG9jay0+c2VjIGlzIGEgdTMyIHZhbHVlLCBzbyBpdCBjYW4KPiArCQkgKiBv
bmx5IHN0b3JlIGRhdGVzIGJldHdlZW4gMTk3MCBhbmQgMjEwNi4gVG8gYWxsb3cKPiArCQkgKiB0
aW1lcyBiZXlvbmQgdGhhdCwgd2UgbmVlZCB0byBjcmVhdGUgYSBuZXcgaHlwZXJjYWxsCj4gKwkJ
ICogaW50ZXJmYWNlIHdpdGggYW4gZXh0ZW5kZWQgcHZjbG9ja193YWxsX2Nsb2NrIHN0cnVjdHVy
ZQo+ICsJCSAqIGxpa2UgQVJNIGhhcy4KPiArCQkgKi8KPiAgCQlub3cudHZfc2VjICA9IHdhbGxf
Y2xvY2stPnNlYzsKCklJVUMgdGhlIGludGVyZmFjZSB5b3UncmUgcHJvYmFibHkgc3BlYWtpbmcg
YWJvdXQgaXMgY29tbW9uIHRvIGJvdGggQVJNIGFuZCB4ODYKb24gWGVuWypdIChzaW5jZSBYZW4g
NC42KSBpLmUuCgoJbm93LnR2X3NlYyAgPSAoKHVpbnQ2NF90KXMtPndjX3NlY19oaSA8PCAzMikg
fCBzLT53Y19zZWM7CgpzIHJlcHJlc2VudGluZyBzdHJ1Y3Qgc2hhcmVkX2luZm8gbGlrZSBvbiBB
Uk0gKHRoZXJlJ3MgYSAzMi1iaXQgaG9sZSB3aGVyZQp3Y19zZWNfaGkgaXMgcGxhY2VkIG9uIHg4
Nl82NC9BUk0pLiBFeGNlcHQgb24geDg2IDMyLWJpdCBndWVzdHMgd2Nfc2VjX2hpIGlzCmxvY2F0
ZWQgZWxzZXdoZXJlLgoKCUpvYW8KClsqXQpodHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2NzLzQu
Ni10ZXN0aW5nL2h5cGVyY2FsbC94ODZfNjQvaW5jbHVkZSxwdWJsaWMseGVuLmguaHRtbCNpbmNv
bnRlbnRzX3N0YXJ0b2ZkYXlfc2hhcmVkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
