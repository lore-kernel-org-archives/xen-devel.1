From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/pv: Clean up cr3 handling in
 arch_set_info_guest()
Date: Wed, 2 Jan 2019 12:07:41 +0000
Message-ID: <20190102120741.4eo4jdffm7wvtsca@zion.uk.xensource.com>
References: <1545399965-5174-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1545399965-5174-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjEsIDIwMTggYXQgMDE6NDY6MDVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBbGwgb2YgdGhpcyBjb2RlIGxpdmVzIGluc2lkZSBDT05GSUdfUFYgd2hpY2ggbWVh
bnMgZ2ZuID09IG1mbiwgYW5kIHRoZQo+IGZpbGxfcm9fbXB0KCkgY2FsbHMgY2xlYXJseSBzaG93
IHRoYXQgdGhlIHZhbHVlIGlzIHVzZWQgdW50cmFuc2xhdGVkLgo+IAo+IENoYW5nZSBjcjNfZ2Zu
IHRvIGEgc3VpdGFibHkgdHlwZWQgY3IzX21mbiwgYW5kIHJlcGxhY2UgZ2V0X3BhZ2VfZnJvbV9n
Zm4oKQo+IHdpdGggYSBzdHJhaWdodCBtZm5fdG9fcGFnZS9nZXRfcGFnZSBzZXF1ZW5jZSwgdG8g
YXZvaWQgdGhlIGltcGxpY2F0aW9uIHRoYXQKPiB0cmFuc2xhdGlvbiBpcyBnb2luZyBvbi4KPiAK
PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
