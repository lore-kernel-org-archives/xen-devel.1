From: "Chen, Farrah" <farrah.chen@intel.com>
Subject: Re: Compiling Xen error on RedHat8.0
Date: Mon, 27 May 2019 01:43:10 +0000
Message-ID: <1B925CC0CD9F3341B32D442251E7E1DC3E299425@SHSMSX104.ccr.corp.intel.com>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E298BE7@SHSMSX104.ccr.corp.intel.com>
 <20190524104044.GA11433@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzIa=T3=intel.com=farrah.chen@srs-us1.protection.inumbo.net>)
 id 1hV4fX-0005rr-J9
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 01:43:19 +0000
In-Reply-To: <20190524104044.GA11433@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW50aG9ueSwKCkJvdGggIiBQWVRIT049L3Vzci9iaW4vcHl0aG9uMiAiIGFuZCBzb2Z0bGlu
ayAicHl0aG9uLWNvbmZpZyIgdG8gInB5dGhvbjItY29uZmlnIiB3b3JrIHdlbGwsIHRoYW5rcyBh
IGxvdCEKCgpUaGFua3MsCkZhbgoKCgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9tOiBB
bnRob255IFBFUkFSRCBbbWFpbHRvOmFudGhvbnkucGVyYXJkQGNpdHJpeC5jb21dIApTZW50OiBG
cmlkYXksIE1heSAyNCwgMjAxOSA2OjQxIFBNClRvOiBDaGVuLCBGYXJyYWggPGZhcnJhaC5jaGVu
QGludGVsLmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSGFvLCBYdWRv
bmcgPHh1ZG9uZy5oYW9AaW50ZWwuY29tPgpTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gQ29tcGls
aW5nIFhlbiBlcnJvciBvbiBSZWRIYXQ4LjAKCk9uIEZyaSwgTWF5IDI0LCAyMDE5IGF0IDA1OjI4
OjUwQU0gKzAwMDAsIENoZW4sIEZhcnJhaCB3cm90ZToKPiBIaSwKCkhpLAoKPiBEbyB5b3UgaGF2
ZSBhbnkgYWR2aWNlIG9uIGJ1aWxkaW5nIFhlbiBvbiBSZWRIYXQ4PyBUaGFua3MgYSBsb3QhCgpJ
ZiB5b3UncmUgYnVpbGRpbmcgYSByZWxlYXNlIG9mIFhlbiwgdGhlbiB5b3UgY291bGQgdHJ5IHNl
dHRpbmcKUFlUSE9OPS91c3IvYmluL3B5dGhvbjIgZXZlcnl3aGVyZSwgdGhhdCBpcyB3aGVuIHN0
YXJ0aW5nIGNvbmZpZ3VyZSBhbmQgbWFrZSwgc29tZXRoaW5nIGxpa2U6CgokIC4vY29uZmlndXJl
IFBZVEhPTj0vdXNyL2Jpbi9weXRob24yIC4uLgokIG1ha2UgUFlUSE9OPS91c3IvYmluL3B5dGhv
bjIgLi4uCgpJZiB5b3UgYXJlIGJ1aWxkaW5nIGZyb20gdGhlIHVuc3RhYmxlIHRyZWUsIEkgdGhp
bmsgd2UgZml4ZWQgbW9zdCBvZiB0aG9zZSBidWdzIHJlbGF0aW5nIHRvIHB5dGhvbjIvcHl0aG9u
My4KCklzIHRoYXQgaGVscD8KCkFib3V0IHRoZSBzb2Z0IGxpbmsgInB5dGhvbiIgdG8gInB5dGhv
bjIiLCB5b3Ugd291bGQgbmVlZCBhIHNvZnRsaW5rICJweXRob24tY29uZmlnIiB0byAicHl0aG9u
Mi1jb25maWciIGFzIHdlbGwgYW5kIHRoZSAiY2hlY2tpbmcgZm9yIFB5QXJnX1BhcnNlVHVwbGUi
IGlzIG1vcmUgbGlrZWx5IHRvIHN1Y2NlZWQuCgpDaGVlcnMsCgotLQpBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
