From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 3/5] tools/dombuilder: Initialise vcpu
 debug registers correctly
Date: Wed, 24 Oct 2018 14:00:23 +0100
Message-ID: <20181024130023.f2tyfoezlp6ahv3m@zion.uk.xensource.com>
References: <1539599780-14549-1-git-send-email-andrew.cooper3@citrix.com>
 <1539599780-14549-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1539599780-14549-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMTE6MzY6MThBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBJbiBwYXJ0aWN1bGFyLCBpbml0aWFsaXNpbmcgJWRyNiB3aXRoIHRoZSB2YWx1ZSAw
IGlzIGJ1Z2d5LCBiZWNhdXNlIG9uCj4gaGFyZHdhcmUgc3VwcG9ydGluZyBUcmFuc25hdGlvbmFs
IE1lbW9yeSwgaXQgd2lsbCBjYXVzZSB0aGUgc3RpY2t5IFJUTSBiaXQgdG8KClR5cG8gIlRyYW5z
bmF0aW9uYWwiCgo+IGJlIGFzc2VydGVkLCBldmVuIHRob3VnaCBhIGRlYnVnIGV4Y2VwdGlvbiBm
cm9tIGEgdHJhbnNhY3Rpb24gaGFzbid0IGFjdHVhbGx5Cj4gYmVlbiBvYnNlcnZlZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gQ0M6
IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgo+IENDOiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiAKPiBUaGUgY29ycmVjdCB3YXkgdG8gZG8gdGhpcyB3b3VsZCBiZSB0byBnZXQvbW9k
aWZ5L3NldCB0aGUgdmNwdSBzdGF0ZSwgYnV0IGl0Cj4gdHVybnMgb3V0IHRoYXQgaXMgaW1wb3Nz
aWJsZSBmb3IgYW4gSFZNIHZjcHUgd2hpY2ggaGFzbid0IHlldCBoYWQgc3RhdGUgc2V0Lgo+IEZp
eGluZyB0aGF0IGlzIGdvaW5nIHRvIHRha2Ugc29tZSBzdWJzdGFudGlhbCB1bnRhbmdsaW5nIGZy
b20gaW1wbGljYXRpb25zIGluCj4gdGhlIG1pZ3JhdGlvbiBzdHJlYW0uCgpBY2tlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkkgaGF2ZW4ndCBjaGVja2VkIHRoZSBtYW51YWwg
cmUgdGhlIHZhbHVlIG9mIGRyNiwgYnV0IEkgdHJ1c3QgSmFuIGFuZApSb2dlcidzIHJldmlldyBv
biB0aGlzLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
