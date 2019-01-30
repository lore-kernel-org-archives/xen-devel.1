From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [xen-unstable test] 132544: regressions - FAIL
Date: Wed, 30 Jan 2019 15:16:07 +0000
Message-ID: <20190130151607.anrekcnd2w5wfrm3@zion.uk.xensource.com>
References: <osstest-132544-mainreport@xen.org>
 <b80b1d86-92d2-8095-d4fb-ac7081e03179@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cj/s=QG=citrix.com=prvs=926cecb90=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gorbD-0000iZ-PC
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 15:16:23 +0000
Content-Disposition: inline
In-Reply-To: <b80b1d86-92d2-8095-d4fb-ac7081e03179@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, osstest service owner <osstest-admin@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMDk6MTU6NThBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyOS8wMS8yMDE5IDE4OjA4LCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6
Cj4gPiBmbGlnaHQgMTMyNTQ0IHhlbi11bnN0YWJsZSByZWFsIFtyZWFsXQo+ID4gaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzMjU0NC8KPiA+IAo+ID4g
UmVncmVzc2lvbnMgOi0oCj4gPiAKPiA+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQg
YXJlIGJsb2NraW5nLAo+ID4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46
Cj4gPiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9tLWRlYmlhbmh2bS1hbWQ2NC14
c20gMTYgZ3Vlc3QtbG9jYWxtaWdyYXRlL3gxMCBmYWlsIFJFR1IuIHZzLiAxMzI0MjIKPiAKPiBE
b2VzIHRoZSBob3N0IGhhdmUgdGhlIGh5cGVyY2FsbCBidWZmZXIgZGV2aWNlIHBhdGNoIChMaW51
eCBrZXJuZWwKPiB1cHN0cmVhbSBjb21taXQgYzUxYjNjNjM5ZTAxZjIwNTU5NTMxZWVmM2M1OTE5
ZmVhZTIzYzU1YSk/CgpBY2NvcmRpbmcgdG8KCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnL29zc3Rlc3QvbG9ncy8xMzI1NDQvYnVpbGQtYW1kNjQtcHZvcHMvaW5mby5odG1sCgpU
aGUgTGludXggdHJlZSB1bmRlciB0ZXN0IGlzIGU2NjA4ZTFmMmZiZDU4MjdkZjlmYTBkYTlhYjFh
ZDY0ZjY4YmU4ZDcgLgoKY29tbWl0IGU2NjA4ZTFmMmZiZDU4MjdkZjlmYTBkYTlhYjFhZDY0ZjY4
YmU4ZDcKQXV0aG9yOiAgICAgR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KQXV0aG9yRGF0ZTogU2F0IEphbiAyNiAwOTozNzowNyAyMDE5ICswMTAwCkNvbW1p
dDogICAgIEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CkNv
bW1pdERhdGU6IFNhdCBKYW4gMjYgMDk6Mzc6MDcgMjAxOSArMDEwMAoKICAgIExpbnV4IDQuMTQu
OTYKCiQgZ2l0IGNoZWNrb3V0IGU2NjA4ZTFmMmZiZDU4MjdkZjlmYTBkYTlhYjFhZDY0ZjY4YmU4
ZDcKJCBnaXQgbG9nIGRyaXZlcnMveGVuCgpJdCBkb2Vzbid0IGFwcGVhciB0byBoYXZlIHRoZSBw
YXRjaCB5b3Ugd2FudC4KCldlaS4KCj4gCj4gCj4gSnVlcmdlbgo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlz
dAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
