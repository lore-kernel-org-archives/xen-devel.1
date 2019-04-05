From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] common/gnttab: Process softirqs while
 dumping grant tables
Date: Fri, 5 Apr 2019 17:38:40 +0100
Message-ID: <3066025e-3e7f-35fc-9586-f4dd7a6c2ade@citrix.com>
References: <1554481990-7569-1-git-send-email-andrew.cooper3@citrix.com>
 <09c1fe49-049c-d893-cd6a-31331f8cdc9c@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4691337206732796132=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <09c1fe49-049c-d893-cd6a-31331f8cdc9c@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============4691337206732796132==
Content-Type: multipart/alternative;
	boundary="------------C78F61DC8F758F25A6032249"
Content-Language: en-GB

--------------C78F61DC8F758F25A6032249
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 05/04/2019 17:35, Julien Grall wrote:
> Hi Andrew,
>
> On 05/04/2019 17:33, Andrew Cooper wrote:
>> OSSTests upgrade to Jessie has identified that with a sufficiently
>> large grant
>> table, a watchdog timeout can occur.
>>
>> http://logs.test-lab.xenproject.org/osstest/logs/134399/test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow/serial-chardonnay0.log
>>
>
> OSSTest log usually disappear after a few days. Who it be possible to
> copy the relevant part of the log instead?

Can do.  Something like:

(XEN) gnttab_usage_print_all [ key 'g' pressed
Apr  4 20:51:42.779992 (XEN)       -------- active --------       -------- shared --------
Apr  4 20:51:42.780081 (XEN) [ref] localdom mfn      pin          localdom gmfn     flags
Apr  4 20:51:42.791855 (XEN) grant-table for remote d0 (v1)
Apr  4 20:51:42.791915 (XEN)   1 frames (64 max), 11 maptrack frames (1024 max)
Apr  4 20:51:42.803911 (XEN) no active grant table entries
Apr  4 20:51:42.803975 (XEN)       -------- active --------       -------- shared --------
Apr  4 20:51:42.804034 (XEN) [ref] localdom mfn      pin          localdom gmfn     flags
Apr  4 20:51:42.815923 (XEN) grant-table for remote d1 (v1)
Apr  4 20:51:42.816040 (XEN)   7 frames (32 max), 0 maptrack frames (1024 max)
Apr  4 20:51:42.827834 (XEN) [0x000]      0 0x27e306 0x00000002          0 0x0fefff 0x19
Apr  4 20:51:42.827877 (XEN) [0x009]      0 0x22d9a1 0x00000001          0 0x02f3a1 0x19
Apr  4 20:51:42.827905 (XEN) [0x00a]      0 0x22d99f 0x00000001          0 0x02f39f 0x19
<snip masses of output>
Apr  4 20:51:49.814701 (XEN) [0x8af]      0 0x232f4f 0x00000001          0 0x029d4f 0x19
Apr  4 20:51:49.826827 (XEN) [0x8b0]      0 0x232f4e 0x00000001          0 0x029(XEN) Watchdog timer detects that CPU0 is stuck!
Apr  4 20:51:49.826903 (XEN) ----[ Xen-4.13-unstable  x86_64  debug=y   Not tainted ]----


~Andrew

--------------C78F61DC8F758F25A6032249
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 05/04/2019 17:35, Julien Grall
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:09c1fe49-049c-d893-cd6a-31331f8cdc9c@arm.com">Hi Andrew,
      <br>
      <br>
      On 05/04/2019 17:33, Andrew Cooper wrote:
      <br>
      <blockquote type="cite">OSSTests upgrade to Jessie has identified
        that with a sufficiently large grant
        <br>
        table, a watchdog timeout can occur.
        <br>
        <br>
<a class="moz-txt-link-freetext" href="http://logs.test-lab.xenproject.org/osstest/logs/134399/test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow/serial-chardonnay0.log">http://logs.test-lab.xenproject.org/osstest/logs/134399/test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow/serial-chardonnay0.log</a>
        <br>
      </blockquote>
      <br>
      OSSTest log usually disappear after a few days. Who it be possible
      to copy the relevant part of the log instead?<br>
    </blockquote>
    <br>
    Can do.  Something like:<br>
    <br>
    <pre>(XEN) gnttab_usage_print_all [ key 'g' pressed
Apr  4 20:51:42.779992 (XEN)       -------- active --------       -------- shared --------
Apr  4 20:51:42.780081 (XEN) [ref] localdom mfn      pin          localdom gmfn     flags
Apr  4 20:51:42.791855 (XEN) grant-table for remote d0 (v1)
Apr  4 20:51:42.791915 (XEN)   1 frames (64 max), 11 maptrack frames (1024 max)
Apr  4 20:51:42.803911 (XEN) no active grant table entries
Apr  4 20:51:42.803975 (XEN)       -------- active --------       -------- shared --------
Apr  4 20:51:42.804034 (XEN) [ref] localdom mfn      pin          localdom gmfn     flags
Apr  4 20:51:42.815923 (XEN) grant-table for remote d1 (v1)
Apr  4 20:51:42.816040 (XEN)   7 frames (32 max), 0 maptrack frames (1024 max)
Apr  4 20:51:42.827834 (XEN) [0x000]      0 0x27e306 0x00000002          0 0x0fefff 0x19
Apr  4 20:51:42.827877 (XEN) [0x009]      0 0x22d9a1 0x00000001          0 0x02f3a1 0x19
Apr  4 20:51:42.827905 (XEN) [0x00a]      0 0x22d99f 0x00000001          0 0x02f39f 0x19
&lt;snip masses of output&gt;
Apr  4 20:51:49.814701 (XEN) [0x8af]      0 0x232f4f 0x00000001          0 0x029d4f 0x19
Apr  4 20:51:49.826827 (XEN) [0x8b0]      0 0x232f4e 0x00000001          0 0x029(XEN) Watchdog timer detects that CPU0 is stuck!
Apr  4 20:51:49.826903 (XEN) ----[ Xen-4.13-unstable  x86_64  debug=y   Not tainted ]----</pre>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------C78F61DC8F758F25A6032249--


--===============4691337206732796132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4691337206732796132==--
