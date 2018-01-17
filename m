From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/5] x86/idt: Factor out enabling and
 disabling of ISTs
Date: Wed, 17 Jan 2018 14:43:34 +0000
Message-ID: <20180117144334.gcmpsv2uqjvc5is7@citrix.com>
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1515782244-6412-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTIsIDIwMTggYXQgMDY6Mzc6MjBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBBbGwgYWx0ZXJhdGlvbiBvZiBJU1Qgc2V0dGluZ3MgKG90aGVyIHRoYW4gdGhlIGNy
YXNoIHBhdGgpIGhhcHBlbiBpbiBhbgo+IGlkZW50aWNhbCB0cmlwbGUuICBJbnRyb2R1Y2UgaGVs
cGVycyB0byBrZWVwIHRoZSB0cmlwbGUgaW4gc3luYywgYW5kIHJlZHVjZQo+IHRoZSByaXNrIG9m
IG9wZW5jb2RlZCBtaXN0YWtlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
