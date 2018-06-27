From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: Address "Bitwise-and with zero
 CONSTANT_EXPRESSION_RESULT" Coverity issues
Date: Wed, 27 Jun 2018 06:40:04 -0600
Message-ID: <5B3385A402000078001CE5D3@prv1-mh.provo.novell.com>
References: <1530102456-18180-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530102456-18180-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjA2LjE4IGF0IDE0OjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ292ZXJpdHkgY29tcGxhaW5zIGF0IGNvZGUgd2hpY2ggd2hpY2ggcGVyZm9ybXMgYSBi
aXR3aXNlIGFuZCB3aXRoIGEgY29uc3RhbnQKPiB0aGF0IGhhcHBlbnMgdG8gYmUgemVyby4gIEJv
dGggX1BBR0VfR05UVEFCIGFuZCBQR19TSF9lbmFibGUgbWF5IGJlIDAKPiBkZXBlbmRpbmcgb24g
S2NvbmZpZyBzZXR0aW5ncy4KPiAKPiBSZWFycmFuZ2UgdGhlIEMgdG8gdGVzdCB0aGUgY29uc3Rh
bnQgZmlyc3QgYW5kIHNob3J0IGNpcmN1aXQgdGhlIGJpdHdpc2UgYW5kLgoKSG1tLCB3ZWxsLCB0
aGlzIG1ha2VzIHRoZSBjb2RlIGxvb2sgcXVpdGUsIGVoZW0sIGludGVyZXN0aW5nLgpOb3JtYWxs
eSBzdWNoIHdvdWxkIHNlZW0gYSBwcmltZSBjYW5kaWRhdGUgZm9yIGNsZWFuaW5nIHVwLAplc3Bl
Y2lhbGx5IHdpdGhvdXQgYW55IGNvbW1lbnQgYXR0YWNoZWQuIEJ1dCBhbnl3YXksIGlmIGl0Cmhl
bHBzIC4uLgoKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
