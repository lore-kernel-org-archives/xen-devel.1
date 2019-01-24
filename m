From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] x86/pv: Clean up cr3 handling in
 arch_set_info_guest()
Date: Thu, 24 Jan 2019 21:42:29 +0000
Message-ID: <ee8053c9-467f-f1a8-5d83-5c69a766d17d@arm.com>
References: <1545399965-5174-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1545399965-5174-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMTIvMjEvMTggMTo0NiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBB
bGwgb2YgdGhpcyBjb2RlIGxpdmVzIGluc2lkZSBDT05GSUdfUFYgd2hpY2ggbWVhbnMgZ2ZuID09
IG1mbiwgYW5kIHRoZQo+IGZpbGxfcm9fbXB0KCkgY2FsbHMgY2xlYXJseSBzaG93IHRoYXQgdGhl
IHZhbHVlIGlzIHVzZWQgdW50cmFuc2xhdGVkLgo+IAo+IENoYW5nZSBjcjNfZ2ZuIHRvIGEgc3Vp
dGFibHkgdHlwZWQgY3IzX21mbiwgYW5kIHJlcGxhY2UgZ2V0X3BhZ2VfZnJvbV9nZm4oKQo+IHdp
dGggYSBzdHJhaWdodCBtZm5fdG9fcGFnZS9nZXRfcGFnZSBzZXF1ZW5jZSwgdG8gYXZvaWQgdGhl
IGltcGxpY2F0aW9uIHRoYXQKPiB0cmFuc2xhdGlvbiBpcyBnb2luZyBvbi4KPiAKPiBObyBmdW5j
dGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gCj4gSnVsaWVuOiBUaGlzIHNob3VsZCBzaW1wbGlmeSB5b3VyICJ4ZW46IFN3
aXRjaCBwYXJhbWV0ZXIgaW4gZ2V0X3BhZ2VfZnJvbV9nZm4KPiB0byB1c2UgdHlwZXNhZmUgZ2Zu
IiBwYXRjaC4gIEluIHBhcnRpY3VsYXIsIEkgZGlkIGEgZG91YmxldGFrZSBhdAo+IGZpbGxfcm9f
bXB0KF9tZm4oZ2ZuX3goY3IzX2dmbikpKTsgd2hlbiByZXZpZXdpbmcgaXQuCgpJIHdhcyBsb29r
aW5nIGF0IHVwZGF0aW5nIG15IHBhdGNoIGFuZCByZW1lbWJlcmVkIHlvdSBzdWdnZXN0ZWQgdG8g
CnJlYmFzZSBvbiB0b3Agb2YgdGhpcy4gRG8geW91IGhhdmUgYW55IHBsYW4gdG8gcmVzZW5kIHRo
ZSBwYXRjaD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
